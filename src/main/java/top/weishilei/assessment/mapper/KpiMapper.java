package top.weishilei.assessment.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import top.weishilei.assessment.domain.Kpi;

import java.util.List;

/**
 * 绩效Mapper
 * @author weishilei
 */
@Mapper
public interface KpiMapper {
    /**
     * 新增
     * @param kpi
     * @return
     */
    Integer insert(Kpi kpi);

    /**
     * 修改
     * @param kpi
     * @return
     */
    Integer update(Kpi kpi);

    /**
     * 根据pid查询
     * @param id
     * @return
     */
    List<Kpi> selectByPid(Integer id);

    /**
     * 根据月日和id查询
     * @param date
     * @param id
     * @return
     */
    Kpi selectByYearMonthDayAndPid(@Param("date") String date, @Param("id") Integer id);

    /**
     * 根据年月和id查询
     * @param date
     * @param id
     * @return
     */
    List<Kpi> selectByYearMonthAndPid(@Param("date") String date, @Param("id") Integer id);

    /**
     * 修改任务概述
     * @param date
     * @param ovewview
     * @return
     */
    Integer updateOverview(@Param("date")String date, @Param("ovewview") String ovewview);
}
