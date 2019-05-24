package top.weishilei.assessment.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import top.weishilei.assessment.domain.Overview;

/**
 * 概述Mapper
 * @author weishilei
 */
@Mapper
public interface OverviewMapper {

    /**
     * 新增概述
     * @param overview
     * @return
     */
    Integer insert(Overview overview);

    /**
     * 修改概述
     * @param overview
     * @return
     */
    Integer update(Overview overview);

    /**
     * 根据pid和时间查询
     * @param id
     * @param date
     * @return
     */
    Overview selectByPidAndYearMonthDay(@Param("id") Integer id, @Param("date") String date);
}
