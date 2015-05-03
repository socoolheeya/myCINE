package mycine.member;

import java.util.Date;

public class MemberDTO {
	
	private int idx;
	private String id;
	private String pwd;
	private String name;
	private String addr;
	private String email;
	private String tel;
	private String birthday;
	private int point;
	private Date joindate;
	
	public MemberDTO(){
		
	}
	
	public MemberDTO(String id, String pwd, String name, String addr,
			String email, String tel, String birthday) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.addr = addr;
		this.email = email;
		this.tel = tel;
		this.birthday = birthday;
	}

	public MemberDTO(int idx, String id, String pwd, String name, String addr,
			String email, String tel, String birthday, int point,
			Date joindate) {
		super();
		this.idx = idx;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.addr = addr;
		this.email = email;
		this.tel = tel;
		this.birthday = birthday;
		this.point = point;
		this.joindate = joindate;
	}

	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point += point;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

}
