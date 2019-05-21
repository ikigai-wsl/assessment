package top.weishilei.assessment.service;

import top.weishilei.assessment.domain.Kpi;

import java.util.List;

/**
 * 绩效Service
 * @author weishilei
 */
public interface KpiService {
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
    Kpi selectByYearMonthDayAndPid(String date, Integer id);

    /**
     * 根据年月和id查询
     * @param date
     * @param id
     * @return
     */
    List<Kpi> selectByYearMonthAndPid(String date, Integer id);
}
