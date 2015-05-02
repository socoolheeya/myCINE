package mycine.movie;

import java.util.Date;

public class MovieDTO {
	
	private int idx;
	private String subject;
	private String review;
	private String director;
	private String actor;
	private Date openDate;
	private String playTime;
	private double grade;
	
	public MovieDTO(){
		
	}

	public MovieDTO(int idx, String subject, String review, String director,
			String actor, Date openDate, String playTime, double grade) {
		super();
		this.idx = idx;
		this.subject = subject;
		this.review = review;
		this.director = director;
		this.actor = actor;
		this.openDate = openDate;
		this.playTime = playTime;
		this.grade = grade;
	}


	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public Date getOpenDate() {
		return openDate;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}

	public String getPlayTime() {
		return playTime;
	}

	public void setPlayTime(String playTime) {
		this.playTime = playTime;
	}

	public double getGrade() {
		return grade;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}
}
