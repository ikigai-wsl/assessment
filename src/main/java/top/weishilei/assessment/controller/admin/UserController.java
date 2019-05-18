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
import top.weishilei.assessment.domain.Result;
import top.weishilei.assessment.domain.User;
import top.weishilei.assessment.service.UserService;
import top.weishilei.assessment.vo.UserVo;

/**
 * 用户Controller
 * @author: weishilei
 */
@Controller
@RequestMapping("/admin/user")
public class UserController extends BaseController {
    @Autowired
    private UserService userService;

    @GetMapping
    public ModelAndView user(Integer id) {
        if (null == id) {
            return new ModelAndView("redirect:/");
        }
        UserVo userVo = userService.selectByIdAndVo(id);
        if (null == userVo) {
            return new ModelAndView("redirect:/");
        }

        ModelAndView modelAndView = new ModelAndView("admin/user");
        modelAndView.addObject("userVo", userVo);

        return modelAndView;
    }

    @GetMapping("/update")
    public ModelAndView update(Integer id) {
        if (null == id) {
            return new ModelAndView("redirect:/");
        }

        User user = userService.selectById(id);
        ModelAndView modelAndView = new ModelAndView("admin/update");
        modelAndView.addObject("userUpdate", user);
        Integer role = getLoginUser().getRole();
        if (role == 0) {
            modelAndView.addObject("userList", userService.select());
        }

        return modelAndView;

    }

    @ResponseBody
    @PostMapping("/update")
    public String update(User user) {
        String response = verifyUser(user);
        if (!StringUtils.isBlank(response)) {
            return response;
        }

        String userStr = user.getUser();
        boolean isExist = userService.selectByUser(userStr) != null;
        if (isExist && user.getUser().equals(userService.selectByUser(userStr).getName())) {
            return Result.failCode("用户名已存在！", Result.USER_IS_EXIST);
        }

        return userService.update(user) > 0 ? Result.success() : Result.fail("修改失败！");
    }

    @ResponseBody
    @GetMapping("/updatePass")
    public String updatePass(Integer id, String pass) {
        if (null == id || id <= 0 || StringUtils.isBlank(pass)) {
            return Result.failCode("参数异常！", Result.PARAM_IS_FAIL);
        }
        Integer loginId = getLoginUser().getId();

        return userService.updatePass(id, pass) > 0 ? Result.success() : Result.fail();
    }

    @GetMapping("/register")
    public ModelAndView showRegister() {
        ModelAndView modelAndView = new ModelAndView("admin/register");
        modelAndView.addObject("userList", userService.select());

        return modelAndView;
    }

    @ResponseBody
    @PostMapping("/register")
    public String register(User user) {
        String response = verifyUser(user);
        if (!StringUtils.isBlank(response)) {
            return response;
        }

        String userStr = user.getUser();
        boolean isExist = userService.selectByUser(userStr) != null;
        if (isExist) {
            return Result.failCode("用户名已存在！", Result.USER_IS_EXIST);
        }

        return userService.insert(user) > 0 ? Result.success() : Result.fail("添加失败！");
    }

    @GetMapping("/logout")
    public ModelAndView logout() {
        getSession().removeAttribute("loginUser");

        return new ModelAndView("redirect:/");
    }

    @GetMapping("/delete")
    public ModelAndView delte(Integer id) {
        userService.delete(id);

        return new ModelAndView("redirect:/");
    }

    private String verifyUser(User user) {
        String userStr = user.getUser();
        String pass = user.getPass();
        String name = user.getName();
        if (StringUtils.isBlank(userStr) || StringUtils.isBlank(pass) || StringUtils.isBlank(name)) {
            return Result.failCode("参数不能为空！", Result.PARAM_IS_EMPTY);
        }

        return "";
    }
}
