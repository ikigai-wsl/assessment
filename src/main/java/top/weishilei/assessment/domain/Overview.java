package top.weishilei.assessment.domain;

import java.util.Date;

/**
 * 任务概述
 * @author: weishilei
 */
public class Overview {
    private Integer id;
    private Integer pid;
    private String overview;
    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Overview{" +
                "id=" + id +
                ", pid=" + pid +
                ", overview='" + overview + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
