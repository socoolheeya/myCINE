package mycine.review.logic;

import java.util.ArrayList;

import mycine.review.model.ReviewDAO;
import mycine.review.model.ReviewDTO;

public class ReviewController {

	public static String searchLogic(int cp, int listSize,
			String requestSubject, String pageName) {

		StringBuffer sb = new StringBuffer();
		ReviewDAO dao = new ReviewDAO();
		ArrayList<ReviewDTO> arr = dao.reviewList(cp, listSize);
		if (arr == null || arr.equals("")) {
			sb.append("<tr>");
			sb.append("<td colspan='6'>글이 없습니다.</td>");
			sb.append("</tr>");
		} else {
			for (int i = 0; i < arr.size(); i++) {
				if (arr.get(i).getSubject().contains(requestSubject)) {
					sb.append("<tr>");
					sb.append("<td>" + arr.get(i).getIdx() + "</td>");
					sb.append("<td><a href='");
					sb.append(pageName);
					sb.append("'?idx='");
					sb.append(arr.get(i).getIdx());
					sb.append("'>");
					sb.append(arr.get(i).getSubject());
					sb.append("</a></td>");

				}
			}

		}
		return sb.toString();

	}
}
