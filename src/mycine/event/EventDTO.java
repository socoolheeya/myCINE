package mycine.event;

public class EventDTO {
	int idx;
	String id;
	String pwd;
	String name;
	int point;
	int e_point;
	String e_prize;
	
	public EventDTO() {
		super();
	}

	public EventDTO(int idx, String id, String pwd, String name, int point,
			int e_point, String e_prize) {
		super();
		this.idx = idx;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.point = point;
		this.e_point = e_point;
		this.e_prize = e_prize;
	}
	public EventDTO(String id, String name, int point) {
		super();
		this.id = id;
		this.name = name;
		this.point = point;
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

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getE_point() {
		return e_point;
	}

	public void setE_point(int e_point) {
		this.e_point = e_point;
	}

	public String getE_prize() {
		return e_prize;
	}

	public void setE_prize(String e_prize) {
		this.e_prize = e_prize;
	}
}
