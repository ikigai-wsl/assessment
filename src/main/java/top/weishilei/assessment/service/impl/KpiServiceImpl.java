package top.weishilei.assessment.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.weishilei.assessment.domain.Kpi;
import top.weishilei.assessment.mapper.KpiMapper;
import top.weishilei.assessment.service.KpiService;

import java.util.List;

/**
 * 绩效Service实现类
 * @author: weishilei
 */
@Service
public class KpiServiceImpl implements KpiService {
    @Autowired
    private KpiMapper kpiMapper;

    @Override
    public Integer insert(Kpi kpi) {
        if (null == kpi) {
            return 0;
        }

        return kpiMapper.insert(kpi);
    }

    @Override
    public Integer update(Kpi kpi) {
        if (null == kpi) {
            return 0;
        }

        return kpiMapper.update(kpi);
    }

    @Override
    public List<Kpi> selectByPid(Integer id) {
        if (null == id || id < 1) {
            return null;
        }

        return kpiMapper.selectByPid(id);
    }

    @Override
    public Kpi selectByYearMonthDayAndPid(String date, Integer id) {
        if (StringUtils.isBlank(date) || null == id || id < 1) {
            return null;
        }

        return kpiMapper.selectByYearMonthDayAndPid(date, id);
    }

    @Override
    public List<Kpi> selectByYearMonthAndPid(String date, Integer id) {
        if (StringUtils.isBlank(date) || null == id || id < 1) {
            return null;
        }

        return kpiMapper.selectByYearMonthAndPid(date, id);
    }
}
