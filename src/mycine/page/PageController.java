package mycine.page;

public class PageController {
	
	public static String pageLogic(String pageName, int totalCnt, int listSize,
			int pageSize, int cp){
		
		int pageCnt = (totalCnt / listSize) + 1;
		if (totalCnt % listSize == 0) {
			pageCnt--;
		}
			
		int groupNumber = cp / pageSize;
		if (cp % pageSize == 0) {
			groupNumber--;
		}
		
		StringBuffer sb = new StringBuffer();

		if (groupNumber != 0) {
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			int temp = (groupNumber - 1) * pageSize + pageSize;
			sb.append(temp);
			sb.append("'>&lt;&lt;</a>");
		}

		for (int i = ((groupNumber * pageSize) + 1); i <= ((groupNumber * pageSize) + pageSize); i++) {
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;&nbsp;");

			if (i == pageCnt)
				break;
		}

		if (groupNumber != ((pageCnt / pageSize) - (pageCnt % pageSize == 0 ? 1
				: 0))) {
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cp=");
			int temp = (groupNumber + 1) * pageSize + 1;
			sb.append(temp);
			sb.append("'>&gt;&gt;</a>");

		}
		return sb.toString();
	}

}
