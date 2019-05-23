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
        Integer role = getLoginUser().getRole();
        String page = "admin/index";
        if (1 == role) {
            page = "redirect:/admin/group";
        } else if (2 == role) {
            page = "redirect:/admin/kpi";
        }
        ModelAndView modelAndView = new ModelAndView(page);
        List<User> userList = userService.select();
        modelAndView.addObject("userList", userList);
        modelAndView.addObject("active", 1);

        return modelAndView;
    }
}
