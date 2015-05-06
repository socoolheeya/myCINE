package mycine.rboard;

import java.util.Date;

public class RequestBoardDTO {

	private int idx;
	private String writer;
	private String movieName;
	private int recommend;
	private int ref;
	private int lev;
	private int sunbun;
	private int requestCheck; // -1이면 true, 0이면 false
	private Date writeDate;

	public RequestBoardDTO() {
	}

	public RequestBoardDTO(String writer, String movieName, Date writeDate) {
		super();
		this.writer = writer;
		this.movieName = movieName;
		this.writeDate = writeDate;
	}
	
	public RequestBoardDTO(int idx, String writer, String movieName,
			int recommend, int ref, int lev, int sunbun, int requestCheck,
			Date writeDate) {
		super();
		this.idx = idx;
		this.writer = writer;
		this.movieName = movieName;
		this.recommend = recommend;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
		this.requestCheck = requestCheck;
		this.writeDate = writeDate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getSunbun() {
		return sunbun;
	}

	public void setSunbun(int sunbun) {
		this.sunbun = sunbun;
	}

	public int getRequestCheck() {
		return requestCheck;
	}

	public void setRequestCheck(int requestCheck) {
		this.requestCheck = requestCheck;
	}

}
