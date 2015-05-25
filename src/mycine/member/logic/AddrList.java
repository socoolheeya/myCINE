package mycine.member.logic;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import mycine.post.PostDTO;

public class AddrList {

	public static String addrList(HttpServletRequest req, String requestDong,
			ArrayList<PostDTO> arr, String zipcode, String addr)
			throws UnsupportedEncodingException {
		req.setCharacterEncoding("utf-8");
		StringBuffer sb = new StringBuffer();

		if (requestDong == null || requestDong.equals("")) {
			sb.append(" <h3>검색어를 입력하지 않았습니다.</h3>");
		} else {
			if (arr == null || arr.size() == 0) {
				sb.append("<h3>검색하신 주소는 없는 주소 입니다.</h3>");
			} else {
				sb.append(" <table border='1' id='addrlist'>");
				sb.append("<thead>");
				sb.append("<tr>");
				sb.append("<th style='font-size:15px; font-weight: bold; text-align: center;'>우편번호</th>");
				sb.append("<th style='font-size:15px; font-weight: bold; text-align: center;'>주소</th>");
				sb.append("</tr>");
				sb.append("</thead>");

				for (int i = 0; i < arr.size(); i++) {
					String sido = arr.get(i).getSido() == null ? "" : arr
							.get(i).getSido();
					String gugun = arr.get(i).getGugun() == null ? "" : arr
							.get(i).getGugun();
					String dong = arr.get(i).getDong() == null ? "" : arr
							.get(i).getDong();
					String ri = arr.get(i).getRi() == null ? "" : arr.get(i)
							.getRi();
					String bunji = arr.get(i).getBunji() == null ? "" : arr
							.get(i).getBunji();
					String bldg = arr.get(i).getBldg() == null ? "" : arr
							.get(i).getBldg();

					zipcode = arr.get(i).getZipcode();
					addr = sido + gugun + dong + ri + bunji + bldg;

					sb.append("<tr>");
					sb.append("<td width='125;' style='text-align: center; padding: 5px;'>${zipcode}</td>");
					sb.append("<td width='700' style='padding-left: 15px;'><a href='searchAddr.do?zipcode=%{zipcode}&addr=${addr}'>${addr}</a></td>");
					sb.append("</tr>");

				}
			}
		}
		sb.append("</table>");

		return sb.toString();
	}
}