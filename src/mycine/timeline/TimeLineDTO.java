package mycine.timeline;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeLineDTO {
	
	private int idx;
	private String userId;
	private String subject;
	private Date dateTime;
	
	public TimeLineDTO(){
		
	}

	public TimeLineDTO(int idx, String userId, String subject, Date dateTime) {
		super();
		this.idx = idx;
		this.userId = userId;
		this.subject = subject;
		this.dateTime = dateTime;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}
	SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
}
