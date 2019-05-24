package top.weishilei.assessment.domain;

import java.util.Date;

/**
 * 绩效
 * @author: weishilei
 */
public class Kpi {
    private Integer id;
    private Integer pid;
    // 完成率
    private Double completion;
    // 完成备注
    private String completionNote;
    // 完成质量分数
    private Double score;
    // 完成质量备注
    private String scoreNote;
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

    public Double getCompletion() {
        return completion;
    }

    public void setCompletion(Double completion) {
        this.completion = completion;
    }

    public String getCompletionNote() {
        return completionNote;
    }

    public void setCompletionNote(String completionNote) {
        this.completionNote = completionNote;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public String getScoreNote() {
        return scoreNote;
    }

    public void setScoreNote(String scoreNote) {
        this.scoreNote = scoreNote;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Kpi{" +
                "id=" + id +
                ", pid=" + pid +
                ", completion=" + completion +
                ", completionNote='" + completionNote + '\'' +
                ", score=" + score +
                ", scoreNote='" + scoreNote + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
