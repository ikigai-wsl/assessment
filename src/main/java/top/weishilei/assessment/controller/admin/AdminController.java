package top.weishilei.assessment.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import top.weishilei.assessment.controller.BaseController;
import top.weishilei.assessment.domain.User;

/**
 * 后台Controller
 * @author: weishilei
 */
@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController {

    @GetMapping("/index")
    public ModelAndView showIndex() {
        return new ModelAndView("admin/index");
    }

    @ResponseBody
    @PostMapping("/register")
    public String register(User user) {
        return "";
    }
}
