package top.weishilei.assessment.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import top.weishilei.assessment.controller.BaseController;
import top.weishilei.assessment.domain.User;
import top.weishilei.assessment.service.UserService;

import java.util.List;

/**
 * 后台Controller
 * @author: weishilei
 */
@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController {
    @Autowired
    private UserService userService;

    @GetMapping("/index")
    public ModelAndView showIndex() {
        ModelAndView modelAndView = new ModelAndView("admin/index");
        List<User> userList = null;
        Integer role = getLoginUser().getRole();
        if (role == 0) {
            userList = userService.select();
        } else {
            Integer id = getLoginUser().getId();
            userList = userService.selectByPid(id);
        }
        modelAndView.addObject("userList", userList);
        modelAndView.addObject("active", 1);

        return modelAndView;
    }
}
