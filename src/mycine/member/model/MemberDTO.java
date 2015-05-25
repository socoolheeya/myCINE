package mycine.member.model;

import java.util.Date;

public class MemberDTO {
	
	private int idx;
	private String id;
	private String pwd;
	private String name;
	private String addr1;
	private String addr2;
	private String email1;
	private String email2;
	private int tel1;
	private int tel2;
	private int tel3;
	private int birthday1;
	private int birthday2;
	private int birthday3;
	private int point;
	private Date joindate;
	private int zipcode1;
	private int zipcode2;
	
	public MemberDTO(){
		
	}
	
	

	public MemberDTO(int idx, String id, String pwd, String name, String addr1,
			String addr2, String email1, String email2, int tel1, int tel2,
			int tel3, int birthday1, int birthday2, int birthday3,
			int zipcode1, int zipcode2) {
		super();
		this.idx = idx;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.email1 = email1;
		this.email2 = email2;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.tel3 = tel3;
		this.birthday1 = birthday1;
		this.birthday2 = birthday2;
		this.birthday3 = birthday3;
		this.zipcode1 = zipcode1;
		this.zipcode2 = zipcode2;
	}

	public MemberDTO(int idx, String id, String pwd, String name, String addr1,
			String addr2, String email1, String email2, int tel1, int tel2,
			int tel3, int birthday1, int birthday2, int birthday3, int point,
			Date joindate, int zipcode1, int zipcode2) {
		super();
		this.idx = idx;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.email1 = email1;
		this.email2 = email2;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.tel3 = tel3;
		this.birthday1 = birthday1;
		this.birthday2 = birthday2;
		this.birthday3 = birthday3;
		this.point = point;
		this.joindate = joindate;
		this.setZipcode1(zipcode1);
		this.setZipcode2(zipcode2);
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

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public int getTel1() {
		return tel1;
	}

	public void setTel1(int tel1) {
		this.tel1 = tel1;
	}

	public int getTel2() {
		return tel2;
	}

	public void setTel2(int tel2) {
		this.tel2 = tel2;
	}

	public int getTel3() {
		return tel3;
	}

	public void setTel3(int tel3) {
		this.tel3 = tel3;
	}

	public int getBirthday1() {
		return birthday1;
	}

	public void setBirthday1(int birthday1) {
		this.birthday1 = birthday1;
	}

	public int getBirthday2() {
		return birthday2;
	}

	public void setBirthday2(int birthday2) {
		this.birthday2 = birthday2;
	}

	public int getBirthday3() {
		return birthday3;
	}

	public void setBirthday3(int birthday3) {
		this.birthday3 = birthday3;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	public int getZipcode1() {
		return zipcode1;
	}

	public void setZipcode1(int zipcode1) {
		this.zipcode1 = zipcode1;
	}

	public int getZipcode2() {
		return zipcode2;
	}

	public void setZipcode2(int zipcode2) {
		this.zipcode2 = zipcode2;
	}
}
