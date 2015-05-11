package mycine.famousline;

public class FamousLineDTO {
	
	private int idx;
	private String name;
	private String famousLine;
	
	public FamousLineDTO(){
	}
	
	public FamousLineDTO(int idx, String name, String famousLine) {
		super();
		this.idx = idx;
		this.name = name;
		this.famousLine = famousLine;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFamousLine() {
		return famousLine;
	}

	public void setFamousLine(String famousLine) {
		this.famousLine = famousLine;
	}
	
}
