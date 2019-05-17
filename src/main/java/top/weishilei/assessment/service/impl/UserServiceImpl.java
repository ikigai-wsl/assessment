package top.weishilei.assessment.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.weishilei.assessment.domain.User;
import top.weishilei.assessment.mapper.UserMapper;
import top.weishilei.assessment.service.UserService;

import java.util.List;

/**
 * 用户Service实现类
 * @author: weishilei
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

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
}
