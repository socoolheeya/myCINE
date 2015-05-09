package mycine.reviewComment;

import java.util.Date;

public class ReviewCommentDTO {
	
	private int idxcmt;
	private int idx;
	private String writer_cmt;
	private String content_cmt;
	private Date writedate_cmt;
	private int recommend_cmt;
	private int ref;
	private int lev;
	private int sunbun;
	
	public ReviewCommentDTO(){
		
	}

	public ReviewCommentDTO(int idxcmt, int idx, String writer_cmt,
			String content_cmt, Date writedate_cmt, int recommend_cmt, int ref,
			int lev, int sunbun) {
		super();
		this.idxcmt = idxcmt;
		this.idx = idx;
		this.writer_cmt = writer_cmt;
		this.content_cmt = content_cmt;
		this.writedate_cmt = writedate_cmt;
		this.recommend_cmt = recommend_cmt;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
	}

	public int getIdxcmt() {
		return idxcmt;
	}

	public void setIdxcmt(int idxcmt) {
		this.idxcmt = idxcmt;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getWriter_cmt() {
		return writer_cmt;
	}

	public void setWriter_cmt(String writer_cmt) {
		this.writer_cmt = writer_cmt;
	}

	public String getContent_cmt() {
		return content_cmt;
	}

	public void setContent_cmt(String content_cmt) {
		this.content_cmt = content_cmt;
	}

	public Date getWritedate_cmt() {
		return writedate_cmt;
	}

	public void setWritedate_cmt(Date writedate_cmt) {
		this.writedate_cmt = writedate_cmt;
	}

	public int getRecommend_cmt() {
		return recommend_cmt;
	}

	public void setRecommend_cmt(int recommend_cmt) {
		this.recommend_cmt = recommend_cmt;
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