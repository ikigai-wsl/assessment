package top.weishilei.assessment.controller.admin;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import top.weishilei.assessment.domain.Result;
import top.weishilei.assessment.domain.User;
import top.weishilei.assessment.service.UserService;

import java.util.List;
import java.util.Map;

/**
 * 小组Controller
 * @author: weishilei
 */
@Controller
@RequestMapping("/admin/group")
public class GroupController {
    @Autowired
    private UserService userService;

    @GetMapping
    public ModelAndView showGroup() {
        ModelAndView modelAndView = new ModelAndView("admin/group");
        List<User> userList = userService.selectByRole(1);
        Map<String, List<User>> userMap = userService.selectLearderAndStaff(userList);
        modelAndView.addObject("userMap", userMap);
        modelAndView.addObject("userList", userList);
        modelAndView.addObject("active", 2);

        return modelAndView;
    }

    @GetMapping("/add")
    public ModelAndView showAddGroup(Integer id, String name) {
        ModelAndView modelAndView = new ModelAndView(("admin/group/addGroup"));
        List<User> userList = userService.selectPidIsNull();
        modelAndView.addObject("userList", userList);
        modelAndView.addObject("id", id);
        modelAndView.addObject("name", name);

        return modelAndView;
    }

    @ResponseBody
    @GetMapping("/addGroup")
    public String addGroup(Integer id, String ids) {
        if (null == id || StringUtils.isBlank(ids)) {
            return Result.failCode("参数不正确！", Result.PARAM_IS_FAIL);
        }

        String[] idArray = ids.split(",");
        for (String temp : idArray) {
            try {
                userService.updatePid(Integer.valueOf(temp), id);
            } catch (Exception e) {
                continue;
            }
        }

        return Result.success();
    }

    @GetMapping("/removeGroup")
    public ModelAndView removeGroup(Integer id) {
        if (null == id) {
            return new ModelAndView("redirect:/admin/group");
        }
        userService.updatePid(id, null);

        return new ModelAndView("redirect:/admin/group");
    }
}
