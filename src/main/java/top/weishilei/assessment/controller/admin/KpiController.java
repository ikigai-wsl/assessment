package top.weishilei.assessment.controller.admin;

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
import top.weishilei.assessment.domain.Result;
import top.weishilei.assessment.domain.User;
import top.weishilei.assessment.service.KpiService;
import top.weishilei.assessment.service.UserService;

import java.util.Calendar;
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

    @GetMapping
    public ModelAndView showKpi() {
        ModelAndView modelAndView = new ModelAndView("admin/kpi");
        List<User> userList = userService.selectByRole(1);
        Map<String, List<User>> userMap = userService.selectLearderAndStaff(userList);
        modelAndView.addObject("userMap", userMap);
        modelAndView.addObject("userList", userList);
        modelAndView.addObject("active", 3);

        return modelAndView;
    }

    @GetMapping("/add")
    public ModelAndView showAddKpi(Integer id, String name) {
        ModelAndView modelAndView = new ModelAndView(("admin/kpi/addKpi"));
        modelAndView.addObject("id", id);
        modelAndView.addObject("name", name);

        return modelAndView;
    }

    @ResponseBody
    @PostMapping("/add")
    public String add(Kpi kpi) {
        if (verifyIsRight(kpi)) {
            return Result.failCode("参数不能为空！", Result.PARAM_IS_EMPTY);
        }

        boolean isExists = kpiService.selectByYearMonthDayAndPid(getYmd(kpi.getCreateTime()), kpi.getPid()) != null;
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

        Kpi kpi = kpiService.selectByYearMonthDayAndPid(getYmd(date), id);
        if (null == kpi) {
            return Result.failCode("当前日期不存在绩效数据！", Result.OBJECT_IS_NULL);
        }

        return Result.success(kpi);
    }

    @GetMapping("/view")
    public ModelAndView viewKpi(Integer id, String name) {
        ModelAndView modelAndView = new ModelAndView("admin/kpi/viewKpi");
        Kpi kpi = kpiService.selectByYearMonthDayAndPid(getYmd(new Date()), id);
        modelAndView.addObject("nowKpi", kpi);
        modelAndView.addObject("id", id);
        modelAndView.addObject("name", name);

        return modelAndView;
    }

    private boolean verifyIsRight(Kpi kpi) {
        String overview = kpi.getOverview();
        String completionNote = kpi.getCompletionNote();
        String scoreNote = kpi.getScoreNote();
        if (StringUtils.isBlank(overview) || StringUtils.isBlank(completionNote) || StringUtils.isBlank(scoreNote)) {
            return true;
        }

        return false;
    }

    private String getYmd(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH) + 1;
        int day = calendar.get(Calendar.DAY_OF_MONTH);
        String d = "" + year + month + day;

        return d;
    }
}
