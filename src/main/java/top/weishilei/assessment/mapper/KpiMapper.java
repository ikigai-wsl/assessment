package top.weishilei.assessment.mapper;

import org.apache.ibatis.annotations.Mapper;
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
}
