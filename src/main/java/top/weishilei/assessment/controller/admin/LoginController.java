package top.weishilei.assessment.controller.admin;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import top.weishilei.assessment.controller.BaseController;
import top.weishilei.assessment.domain.Result;
import top.weishilei.assessment.domain.User;
import top.weishilei.assessment.interceptor.AdminInterceptor;
import top.weishilei.assessment.service.impl.UserServiceImpl;

/**
 * 登录Controller
 * @author: weishilei
 */
@Controller
public class LoginController extends BaseController {
    @Autowired
    private UserServiceImpl userService;

    @GetMapping("/login")
    public ModelAndView showLogin() {
        if (getSession().getAttribute(AdminInterceptor.LOGIN_USER) == null) {
            return new ModelAndView("login");
        }

        return new ModelAndView("/admin/index");
    }

    @ResponseBody
    @PostMapping("/login")
    public String login(User user) {
        String userStr = user.getUser();
        String pass = user.getPass();
        if (StringUtils.isBlank(userStr) || StringUtils.isBlank(pass)) {
            return Result.failCode("账号或密码错误！", Result.USER_OR_PASS_IS_FAIL);
        }

        user = userService.selectByUser(userStr);
        if (null == user) {
            return Result.failCode("账号或密码错误！", Result.USER_OR_PASS_IS_FAIL);
        }
        String loginPass = user.getPass();
        if (!pass.equals(loginPass)) {
            return Result.failCode("账号或密码错误！", Result.USER_OR_PASS_IS_FAIL);
        }
        getSession().setAttribute("loginUser", user);

        return Result.success();
    }
}
