package top.weishilei.assessment.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.weishilei.assessment.domain.User;
import top.weishilei.assessment.mapper.UserMapper;
import top.weishilei.assessment.service.UserService;
import top.weishilei.assessment.vo.UserVo;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户Service实现类
 * @author: weishilei
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    private Map<Integer, String> roleMap = new HashMap<>();

    public UserServiceImpl() {
        roleMap.put(0, "管理员");
        roleMap.put(1, "组长");
        roleMap.put(2, "员工");
    }

    @Override
    public List<User> select() {
        return userMapper.select();
    }

    @Override
    public User selectById(Integer id) {
        if (null == id || id < 1) {
            return null;
        }

        return userMapper.selectById(id);
    }

    @Override
    public UserVo selectByIdAndVo(Integer id) {
        if (null == id || id < 1) {
            return null;
        }
        User user = selectById(id);
        if (null == user) {
            return null;
        }

        UserVo userVo = new UserVo();
        assemblyUserVo(user, userVo);

        return userVo;
    }

    @Override
    public List<User> selectByPid(Integer id) {
        if (null == id || id < 1) {
            return null;
        }

        return userMapper.selectByPid(id);
    }

    @Override
    public User selectByUser(String user) {
        if (StringUtils.isBlank(user)) {
            return null;
        }

        return userMapper.selectByUser(user);
    }

    @Override
    public Integer insert(User user) {
        if (null == user) {
            return 0;
        }

        user.setCreateTime(new Date());
        return userMapper.insert(user);
    }

    @Override
    public Integer update(User user) {
        if (null == user) {
            return 0;
        }

        return userMapper.update(user);
    }

    @Override
    public Integer delete(Integer id) {
        if (null == id || id < 1) {
            return 0;
        }

        return userMapper.delete(id);
    }

    @Override
    public Integer updatePass(Integer id, String pass) {
        if (null == id || id < 1 || StringUtils.isBlank(pass)) {
            return 0;
        }

        return userMapper.updatePass(id, pass);
    }

    /**
     * 组装UserVo
     * @param user
     */
    private void assemblyUserVo(User user, UserVo userVo) {
        userVo.setId(user.getId());
        userVo.setName(user.getName());
        userVo.setPass(user.getPass());
        userVo.setUser(user.getUser());
        userVo.setRole(roleMap.get(user.getRole()));
        if (user.getRole() == 0) {
            userVo.setpName("无");
        } else {
            User pUser = selectById(user.getPid());
            userVo.setpName(pUser.getName());
        }
    }
}
