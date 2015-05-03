package mycine.qna;

import java.sql.*;

public class QnaDTO {
	private int Q_idx;
	private String Q_writer;
	private String Q_pwd;
	private String Q_subject;
	private String Q_content;
	private Date Q_writedate;
	private int Q_readnum;
	private int Q_ref;
	private int Q_lev;
	private int Q_sunbun;
	public QnaDTO() {
		super();
	}
	public QnaDTO(int q_idx, String q_writer, String q_pwd, String q_subject,
			String q_content, Date q_writedate, int q_readnum, int q_ref,
			int q_lev, int q_sunbun) {
		super();
		Q_idx = q_idx;
		Q_writer = q_writer;
		Q_pwd = q_pwd;
		Q_subject = q_subject;
		Q_content = q_content;
		Q_writedate = q_writedate;
		Q_readnum = q_readnum;
		Q_ref = q_ref;
		Q_lev = q_lev;
		Q_sunbun = q_sunbun;
	}
	public int getQ_idx() {
		return Q_idx;
	}
	public void setQ_idx(int q_idx) {
		Q_idx = q_idx;
	}
	public String getQ_writer() {
		return Q_writer;
	}
	public void setQ_writer(String q_writer) {
		Q_writer = q_writer;
	}
	public String getQ_pwd() {
		return Q_pwd;
	}
	public void setQ_pwd(String q_pwd) {
		Q_pwd = q_pwd;
	}
	public String getQ_subject() {
		return Q_subject;
	}
	public void setQ_subject(String q_subject) {
		Q_subject = q_subject;
	}
	public String getQ_content() {
		return Q_content;
	}
	public void setQ_content(String q_content) {
		Q_content = q_content;
	}
	public Date getQ_writedate() {
		return Q_writedate;
	}
	public void setQ_writedate(Date q_writedate) {
		Q_writedate = q_writedate;
	}
	public int getQ_readnum() {
		return Q_readnum;
	}
	public void setQ_readnum(int q_readnum) {
		Q_readnum = q_readnum;
	}
	public int getQ_ref() {
		return Q_ref;
	}
	public void setQ_ref(int q_ref) {
		Q_ref = q_ref;
	}
	public int getQ_lev() {
		return Q_lev;
	}
	public void setQ_lev(int q_lev) {
		Q_lev = q_lev;
	}
	public int getQ_sunbun() {
		return Q_sunbun;
	}
	public void setQ_sunbun(int q_sunbun) {
		Q_sunbun = q_sunbun;
	}

}
