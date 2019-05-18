package top.weishilei.assessment.vo;

/**
 * @author: weishilei
 */
public class UserVo {
    private Integer id;
    private String user;
    private String pass;
    private String name;
    private String role;
    private String pName;

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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    @Override
    public String toString() {
        return "UserVo{" +
                "id=" + id +
                ", user='" + user + '\'' +
                ", pass='" + pass + '\'' +
                ", name='" + name + '\'' +
                ", role='" + role + '\'' +
                ", pName='" + pName + '\'' +
                '}';
    }
}
