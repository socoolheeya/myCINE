package mycine.event;

public class EventDTO {
	
	int idx;
	String id;
	int point;
	String user_prize;

	public EventDTO(String id, int point) {
		super();
		this.id = id;
		this.point = point;
	}
	
	public EventDTO(String id, String user_prize) {
		super();
		this.id = id;
		this.user_prize = user_prize;
	}
	
	public EventDTO(int idx, String id, int point, String user_prize) {
		super();
		this.idx = idx;
		this.id = id;
		this.point = point;
		this.user_prize = user_prize;
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
}