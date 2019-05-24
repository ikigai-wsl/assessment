package top.weishilei.assessment.controller.admin;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.weishilei.assessment.controller.BaseController;
import top.weishilei.assessment.domain.Overview;
import top.weishilei.assessment.domain.Result;
import top.weishilei.assessment.service.OverviewService;

import java.util.Date;

/**
 * 任务概述Controller
 * @author: weishilei
 */
@Controller
@RequestMapping("/admin/overview")
public class OverviewController extends BaseController {
    @Autowired
    private OverviewService overviewService;

    @ResponseBody
    @RequestMapping("/getOverview")
    public String overview(Date date,Integer id) {
        if (null == id || id < 1) {
            return Result.failCode("参数不能为空！", Result.PARAM_IS_EMPTY);
        }

        Overview overview = overviewService.selectByPidAndYearMonthDay(id, getYmd(date, false));
        if (null == overview) {
            return Result.fail() ;
        }

        return Result.success(overview);
    }

    @ResponseBody
    @RequestMapping("/save")
    public String saveOverview(Integer id, String overviewNote) {
        if (null == id || id < 1 || StringUtils.isBlank(overviewNote)) {
            return Result.failCode("参数错误！", Result.PARAM_IS_EMPTY);
        }

        Overview overview = overviewService.selectByPidAndYearMonthDay(id, getYmd(new Date(), false));
        boolean isSuccess = false;
        if (null == overview) {
            overview = new Overview();
            overview.setPid(id);
            overview.setOverview(overviewNote);
            overview.setCreateTime(new Date());
            isSuccess = overviewService.insert(overview) > 0;
        } else {
            overview.setOverview(overviewNote);
            isSuccess = overviewService.update(overview) > 0;
        }

        return isSuccess ? Result.success() : Result.fail();
    }

}
