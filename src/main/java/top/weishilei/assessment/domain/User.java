package top.weishilei.assessment.domain;

import java.util.Date;

/**
 * 用户domain
 * @author: weishilei
 */
public class User {
    private Integer id;
    private String user;
    private String pass;
    private String name;
    // 0：管理员，1：组长，3：员工
    private Integer role;
    private Integer pid;
    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", user='" + user + '\'' +
                ", pass='" + pass + '\'' +
                ", name='" + name + '\'' +
                ", role=" + role +
                ", pid=" + pid +
                ", createTime=" + createTime +
                '}';
    }
}
