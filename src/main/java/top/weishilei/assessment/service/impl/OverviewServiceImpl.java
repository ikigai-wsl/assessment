package top.weishilei.assessment.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.weishilei.assessment.domain.Overview;
import top.weishilei.assessment.mapper.OverviewMapper;
import top.weishilei.assessment.service.OverviewService;

/**
 * 任务概述Service实现类
 * @author: weishilei
 */
@Service
public class OverviewServiceImpl implements OverviewService {
    @Autowired
    private OverviewMapper overviewMapper;

    @Override
    public Integer insert(Overview overview) {
        if (null == overview) {
            return 0;
        }

        return overviewMapper.insert(overview);
    }

    @Override
    public Integer update(Overview overview) {
        if (null == overview) {
            return 0;
        }

        return overviewMapper.update(overview);
    }

    @Override
    public Overview selectByPidAndYearMonthDay(Integer id, String date) {
        if (null == id || id < 1 || StringUtils.isBlank(date)) {
            return null;
        }

        return overviewMapper.selectByPidAndYearMonthDay(id, date);
    }
}
