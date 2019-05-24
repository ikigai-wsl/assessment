package top.weishilei.assessment.service;

import top.weishilei.assessment.domain.Overview;

/**
 * 任务概述Service
 * @author weishilei
 */
public interface OverviewService {
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
    Overview selectByPidAndYearMonthDay(Integer id, String date);
}
