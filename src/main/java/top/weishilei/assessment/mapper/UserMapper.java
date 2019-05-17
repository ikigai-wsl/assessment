package top.weishilei.assessment.mapper;

import org.apache.ibatis.annotations.Mapper;
import top.weishilei.assessment.domain.User;

import java.util.List;

/**
 * 用户Mapper
 * @author weishilei
 */
@Mapper
public interface UserMapper {
    /**
     * 查询全部
     * @return
     */
    List<User> select();

    /**
     * 根据id查询
     * @param id
     * @return
     */
    User selectById(Integer id);

    /**
     * 根据pid查询
     * @param id
     * @return
     */
    List<User> selectByPid(Integer id);

    /**
     * 根据用户名查询
     * @param user
     * @return
     */
    User selectByUser(String user);

    /**
     * 新增
     * @param user
     * @return
     */
    Integer insert(User user);

    /**
     * 修改
     * @param user
     * @return
     */
    Integer update(User user);

    /**
     * 删除
     * @param id
     * @return
     */
    Integer delete(Integer id);
}