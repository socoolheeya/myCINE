package mycine.event;

public class EventDTO {
	
	String id;
	int idx;
	int point;
	String user_prize;
	String use;
	String e_prize;
	
	public EventDTO() {
		super();
	}

	public EventDTO(String id,int point, String user_prize) {
		super();
		this.id = id;
		this.point = point;
		this.user_prize = user_prize;
	}
	

	public EventDTO(String id, int point) {
		super();
		this.id = id;
		this.point = point;
	}

	public EventDTO(String id,int idx, String user_prize,String use) {
		super();
		this.id = id;
		this.idx = idx;
		this.user_prize = user_prize;
		this.use=use;
	}
	

	public EventDTO(String id, String e_prize) {
		super();
		this.id = id;
		this.e_prize = e_prize;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getUser_prize() {
		return user_prize;
	}

	public void setUser_prize(String user_prize) {
		this.user_prize = user_prize;
	}

	public String getUse() {
		return use;
	}

	public void setUse(String use) {
		this.use = use;
	}

	public String getE_prize() {
		return e_prize;
	}

	public void setE_prize(String e_prize) {
		this.e_prize = e_prize;
	}
}