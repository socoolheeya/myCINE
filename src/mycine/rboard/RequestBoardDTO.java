package mycine.rboard;

import java.util.Date;

public class RequestBoardDTO {
	
	private int idx;
	private String writer;
	private String movieName;
	private Date writeDate;
	private boolean requestCheck;
	private int recommend;
	private int ref;
	private int lev;
	private int sunbun;
	
	public RequestBoardDTO(){}
	
	public RequestBoardDTO(int idx, String writer, String movieName,
			Date writeDate, boolean requestCheck, int recommend, int ref,
			int lev, int sunbun) {
		super();
		this.idx = idx;
		this.writer = writer;
		this.movieName = movieName;
		this.writeDate = writeDate;
		this.requestCheck = requestCheck;
		this.recommend = recommend;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
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

	public boolean isRequestCheck() {
		return requestCheck;
	}

	public void setRequestCheck(boolean requestCheck) {
		this.requestCheck = requestCheck;
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
}
