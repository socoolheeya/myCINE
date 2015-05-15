package mycine.friend;

public class FriendDTO {
	
	private int idx;
	private String friendId;
	private String friendName;
	
	public FriendDTO(){
		
	}

	public FriendDTO(int idx, String friendId, String friendName) {
		super();
		this.idx = idx;
		this.friendId = friendId;
		this.friendName = friendName;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getFriendId() {
		return friendId;
	}

	public void setFriendId(String friendId) {
		this.friendId = friendId;
	}

	public String getFriendName() {
		return friendName;
	}

	public void setFriendName(String friendName) {
		this.friendName = friendName;
	}
}