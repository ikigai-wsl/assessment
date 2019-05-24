package top.weishilei.assessment.controller.admin;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import top.weishilei.assessment.controller.BaseController;
import top.weishilei.assessment.domain.Kpi;
import top.weishilei.assessment.domain.Overview;
import top.weishilei.assessment.domain.Result;
import top.weishilei.assessment.domain.User;
import top.weishilei.assessment.service.KpiService;
import top.weishilei.assessment.service.OverviewService;
import top.weishilei.assessment.service.UserService;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 绩效Controller
 * @author: weishilei
 */
@Controller
@RequestMapping("/admin/kpi")
public class KpiController extends BaseController {
    @Autowired
    private UserService userService;
    @Autowired
    private KpiService kpiService;
    @Autowired
    private OverviewService overviewService;

    @GetMapping
    public ModelAndView showKpi() {
        ModelAndView modelAndView = new ModelAndView("admin/kpi");
        List<User> userList = userService.selectByRole(1);
        Map<String, List<User>> userMap = userService.selectLearderAndStaff(userList);
        modelAndView.addObject("userMap", userMap);
        modelAndView.addObject("userList", userList);
        modelAndView.addObject("active", 3);
        if (getLoginUser().getRole() != 0) {
            Overview overview = overviewService.selectByPidAndYearMonthDay(getLoginUser().getId(), getYmd(new Date(), false));
            if (overview != null) {
                modelAndView.addObject("overview", overview);
            }
        }

        return modelAndView;
    }

    @GetMapping("/add")
    public ModelAndView showAddKpi(Integer id, String name) {
        ModelAndView modelAndView = new ModelAndView(("admin/kpi/addKpi"));
        Overview overview = overviewService.selectByPidAndYearMonthDay(id, getYmd(new Date(), false));
        modelAndView.addObject("id", id);
        modelAndView.addObject("name", name);
        if (null != overview) {
            modelAndView.addObject("overview", overview);
        }

        return modelAndView;
    }

    @ResponseBody
    @PostMapping("/add")
    public String add(Kpi kpi) {
        if (verifyIsRight(kpi)) {
            return Result.failCode("参数不能为空！", Result.PARAM_IS_EMPTY);
        }

        boolean isExists = kpiService.selectByYearMonthDayAndPid(getYmd(kpi.getCreateTime(),false), kpi.getPid()) != null;
        if (isExists) {
            return Result.fail("当前日期已存在数据！");
        }
        boolean isSuccess = kpiService.insert(kpi) > 0;

        return isSuccess ? Result.success() : Result.fail();
    }

    @GetMapping("/update")
    public ModelAndView showUpdateApi(Integer id, String name) {
        ModelAndView modelAndView = new ModelAndView("admin/kpi/updateKpi");
        modelAndView.addObject("id", id);
        modelAndView.addObject("name", name);

        return modelAndView;
    }

    @ResponseBody
    @PostMapping("/update")
    public String updateKpi(Kpi kpi) {
        if (verifyIsRight(kpi)) {
            return Result.failCode("参数不能为空！", Result.PARAM_IS_EMPTY);
        }

        boolean isSuccess = kpiService.update(kpi) > 0;

        return isSuccess ? Result.success() : Result.fail();
    }

    @ResponseBody
    @GetMapping("/getKpi")
    public String kpi(Date date, Integer id) {
        if (null == id || id < 0) {
            return Result.failCode("参数不能为空！", Result.PARAM_IS_EMPTY);
        }

        Kpi kpi = kpiService.selectByYearMonthDayAndPid(getYmd(date, false), id);
        if (null == kpi) {
            return Result.failCode("当前日期不存在数据！", Result.OBJECT_IS_NULL);
        }
        Overview overview = overviewService.selectByPidAndYearMonthDay(id, getYmd(date, false));
        JSONObject jsonObject = (JSONObject) JSONObject.toJSON(kpi);
        jsonObject.put("overview", overview.getOverview());

        return Result.success(jsonObject);
    }

    @GetMapping("/view")
    public ModelAndView viewKpi(Integer id, String name) {
        ModelAndView modelAndView = new ModelAndView("admin/kpi/viewKpi");
        Kpi kpi = kpiService.selectByYearMonthDayAndPid(getYmd(new Date(), false), id);
        Overview overview = overviewService.selectByPidAndYearMonthDay(id, getYmd(new Date(), false));
        modelAndView.addObject("nowKpi", kpi);
        modelAndView.addObject("overview", overview);
        modelAndView.addObject("id", id);
        modelAndView.addObject("name", name);

        return modelAndView;
    }

    @ResponseBody
    @GetMapping("/viewMonth")
    public String viewMonth(Date date, Integer id) {
        if (null == id || id < 0) {
            return Result.failCode("参数不能为空！", Result.PARAM_IS_EMPTY);
        }

        List<Kpi> kpiList = kpiService.selectByYearMonthAndPid(getYm(date), id);
        if (null == kpiList || kpiList.size() < 1) {
            return Result.fail();
        }

        Integer total = kpiList.size() * 2;
        double realTotal = 0;
        for (Kpi kpi : kpiList) {
            realTotal += kpi.getScore() + kpi.getCompletion();
        }

        DecimalFormat df = new DecimalFormat("#.00");
        String result = df.format(realTotal / total * 60);

        JSONObject jsonObject = new JSONObject();
        List<String> idList = new ArrayList<>();
        List<String> dateList = new ArrayList<>();
        List<String> scoreList = new ArrayList<>();
        List<String> completionList = new ArrayList<>();
        jsonObject.put("result", result);
        jsonObject.put("idList", idList);
        jsonObject.put("dateList", dateList);
        jsonObject.put("scoreList", scoreList);
        jsonObject.put("completionList", completionList);
        for (Kpi kpi : kpiList) {
            idList.add(kpi.getId().toString());
            dateList.add(getYmd(kpi.getCreateTime(), true));
            scoreList.add(kpi.getScore().toString());
            completionList.add(kpi.getCompletion().toString());
        }

        return Result.success(jsonObject);
    }

    private boolean verifyIsRight(Kpi kpi) {
        String completionNote = kpi.getCompletionNote();
        String scoreNote = kpi.getScoreNote();
        if (StringUtils.isBlank(completionNote) || StringUtils.isBlank(scoreNote)) {
            return true;
        }

        return false;
    }

}
