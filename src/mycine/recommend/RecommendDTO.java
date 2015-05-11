package mycine.recommend;

public class RecommendDTO {
	
	private int idx;
	private int checked; //추천값. 추천 전:-1, 추천 후:0 
	private String id;


	public RecommendDTO(){
		
	}
	
	public RecommendDTO(int idx, int checked) {
		super();
		this.idx = idx;
		this.checked = checked;
	}

	public RecommendDTO(int idx, int checked, String id) {
		super();
		this.idx = idx;
		this.checked = checked;
		this.id = id;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getChecked() {
		return checked;
	}

	public void setChecked(int checked) {
		this.checked = checked;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
