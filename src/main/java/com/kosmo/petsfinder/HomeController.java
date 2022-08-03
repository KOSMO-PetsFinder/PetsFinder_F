package com.kosmo.petsfinder;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import petsfinder.member.MemberDAOImpl;
import petsfinder.member.MemberDTO;
import petsfinder.utils.CookieManager;

@Controller
public class HomeController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/Petsitters/petsitters")
	public String sitter() {
		return "./Petsitters/petsitters";
	}
	
	@RequestMapping("/Login")
	public String login() {
		return "Login";
	}
	
	@SuppressWarnings("null")
	@RequestMapping(value="/NaverLogin", method=RequestMethod.GET)
	public String naverLogin(Model model, HttpServletRequest req) {
		
		String clientId = "DdXnsRLETvCMpBvo8zo2";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "dmNcWO32M7";//애플리케이션 클라이언트 시크릿값";
	    String code = req.getParameter("code");
	    String state = req.getParameter("state");
	    String redirectURI = "";
		try {
			redirectURI = URLEncoder.encode("http://localhost:8088/PetsFinder/", "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    String access_token = "";
	    String refresh_token = "";
	    try {
	    	URL url = new URL(apiURL);
	    	HttpURLConnection con = (HttpURLConnection)url.openConnection();
	    	con.setRequestMethod("GET");
	    	int responseCode = con.getResponseCode();
	    	BufferedReader br;
	    	if(responseCode==200) { // 정상 호출
	    		br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	    	} else {  // 에러 발생
	    		br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	    	}
	        String inputLine;
	        StringBuffer res = new StringBuffer();
	        while ((inputLine = br.readLine()) != null) {
	        	res.append(inputLine);
	        }
	        br.close();
	        if(responseCode==200) {
	        	JSONParser parsing = new JSONParser();
	        	Object obj = parsing.parse(res.toString());
	        	JSONObject jsonObj = (JSONObject)obj;
    			        
	        	access_token = (String)jsonObj.get("access_token");
	        	refresh_token = (String)jsonObj.get("refresh_token");
	        }
	    } catch (Exception e) {
	    	System.out.println(e);
	    }
		
	    if(access_token != null) { // access_token을 잘 받아왔다면
	    	try {
	    		String token = access_token; // 네이버 로그인 접근 토큰;
	            String header = "Bearer " + token; // Bearer 다음에 공백 추가
	    		String apiurl = "https://openapi.naver.com/v1/nid/me";
	    		URL url = new URL(apiurl);
	    		HttpURLConnection con = (HttpURLConnection)url.openConnection();
	    		con.setRequestMethod("GET");
	    		con.setRequestProperty("Authorization", header);
	    		int responseCode = con.getResponseCode();
	    		BufferedReader br;
	    		if(responseCode==200) { // 정상 호출
	    			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	    		} else {  // 에러 발생
	    			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	    		}
	    		String inputLine;
	    		StringBuffer res = new StringBuffer();
	    		while ((inputLine = br.readLine()) != null) {
	    			res.append(inputLine);
	    			JSONParser parsing = new JSONParser();
	    			Object obj = parsing.parse(res.toString());
	    			JSONObject jsonObj = (JSONObject)obj;
	    			JSONObject resObj = (JSONObject)jsonObj.get("response");
	    			String splitToken = access_token.substring(1, 5) + access_token.substring(40, 44);

	    			String id = ((String)resObj.get("id")).substring(5, 14);
	    			String pw = splitToken;
	    			String email = (String)resObj.get("email");
	    			String address = " ";
	    			String name = (String)resObj.get("name");
	    			String phone = (String)resObj.get("mobile");
	    			String birthday = (String)resObj.get("birthyear") + "-" + (String)resObj.get("birthday");
	    			String gender = (String)resObj.get("gender");
	    			String photo = (String)resObj.get("profile_image");
	    			
	    			String id_val = sqlSession.getMapper(MemberDAOImpl.class).idValidate(id);
	    			
	    			if (id_val == null) {
	    				
	    				MemberDTO dto = new MemberDTO();
	    				
	    				dto.setMember_id(id);
	    				dto.setMember_pass(pw);
	    				dto.setMember_email(email);
	    				dto.setMember_addr(address);
	    				dto.setMember_name(name);
	    				dto.setMember_phone(phone);
	    				//dto.setMember_birth(birthday);
	    				dto.setMember_gender(gender);
	    				dto.setMember_photo(photo);
	    				
	    				int result = sqlSession.getMapper(MemberDAOImpl.class).memberInsert(dto);
	    				if(result == 1) 
	    					System.out.println("네이버 회원 가입 완료");
	    				else 
	    					System.out.println("네이버 회원 가입 실패");
	    			} else {
	    				System.out.println("이미 있는 아이디");
	    			}
	    			System.out.println("네이버 로그인");
	    			HttpSession session = req.getSession();
	    			session.setAttribute("id", id);
	    			session.setAttribute("name", name);
	    			session.setAttribute("email", email);
	    		}
	    		br.close();
	        } catch (Exception e) {
	        	e.printStackTrace();
	        }
	    }

		return "redirect:./";
	}
	
	@RequestMapping(value="/Login", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		String id = req.getParameter("id");
		String pass = req.getParameter("password");
		String save_check = req.getParameter("save_check");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMember_id(id);
		memberDTO.setMember_pass(pass);
		MemberDTO dto = sqlSession.getMapper(MemberDAOImpl.class).memberLogin(memberDTO);
		
		if(dto != null) {
			session.setAttribute("id", dto.getMember_id());
			session.setAttribute("name", dto.getMember_name());
			session.setAttribute("email", dto.getMember_email());
			if (save_check != null && save_check.equals("Y")) {
				// 쿠키 생성. 쿠키값은 로그인 아이디, 유효기간은 1일로 설정
				CookieManager.makeCookie(resp, "loginId", id, 86400);
			} else {
				// 체크를 해제한 경우에는 쿠키 삭제.
				CookieManager.deleteCookie(resp, "loginId");
			}
		}
		
		model.addAttribute("dto", dto);
		return "redirect:./";
	}
	
	@RequestMapping("/Logout")
	public String logout() {
		return "Logout";
	}
	
	
	@RequestMapping("/Regist")
	public String regist() {
		return "registration";
	}
	
	@RequestMapping("/idDuple")
	@ResponseBody
	public void idDuple(Model model, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		resp.setContentType("text/html; charset=UTF-8");
		String member_id = req.getParameter("user_id");
		
		String result = "";
		System.out.println(member_id);
		if(member_id == "") {
	        
			result = "아이디 입력하세요";
			
	    // 아이디 입력 O
		} else {
	        // 아이디가 6 ~ 12자리인지 확인
	        if(member_id.length() >= 6 && member_id.length() <= 12) {
	        	boolean check = true;
	          	for(int i = 0; i < member_id.length(); i++) {
		            int ascii = member_id.charAt(i);
		            if(!((ascii >= 48 && ascii <= 57)
		                || (ascii >= 65 && ascii <= 90) || (ascii >= 97 && ascii <= 122))) {
		            	check = false;
		            	break;
		            }
	          	}
				// check가 false이면 영문, 숫자 이외의 문자가 입력되었으므로 새로 입력하라는 문구 출력
				if(check == false) {
					result = "아이디는 영문과 숫자의 조합으로 입력하세요";
				} else {
					String id = sqlSession.getMapper(MemberDAOImpl.class).idValidate(member_id);
					
					if(id == null) {
						result = "사용 가능합니다";
					} else if (id.equals(member_id)) {
						result = "중복되었습니다";
					}
	            }
	        } else {
	        	result = "아이디는 6자리에서 12자리로 입력하세요";
	        }
		}
		PrintWriter pw = resp.getWriter();
		pw.print(result);
	}
	
	@RequestMapping(value="/Regist", method = RequestMethod.POST)
	public String Regist(Model model, HttpServletRequest req, MemberDTO memberDTO) {
		
//		String id = req.getParameter("user_id");
//		String pw = req.getParameter("pass2");
//		String name = req.getParameter("name");
//		String birth = req.getParameter("birth");
//		String gender = req.getParameter("gender");
//		String email = req.getParameter("email");
		String address = req.getParameter("zipcode") + " " + req.getParameter("address1") + req.getParameter("address2");
		String phone = req.getParameter("mobile1") + "-" + req.getParameter("mobile2") + "-" + req.getParameter("mobile3");
//		
//		member_idx,
//		member_id,
//		member_pass,
//		member_type, 
//		member_email,
//		member_addr,
//		member_name,
//		member_phone,
//		member_reg,
//		member_birth,
//		member_gender
//		member_photo
		
//		MemberDTO dto = new MemberDTO();
//		dto.setMember_id(id);
//		dto.setMember_pass(pw);
//		dto.setMember_email(email);
		memberDTO.setMember_addr(address);
//		dto.setMember_name(name);
		memberDTO.setMember_phone(phone);
//		dto.setMember_birth(birth);
//		dto.setMember_gender(gender);
		System.out.println(memberDTO.getMember_id());
		
		int success = sqlSession.getMapper(MemberDAOImpl.class).memberInsert(memberDTO);
		
		if(success == 1) {
			System.out.println("회원가입 성공");
			return "redirect:./";
		} else {
			System.out.println("회원가입 실패");
			return "redirect:./Regist";
		}
		
	}
	
}
