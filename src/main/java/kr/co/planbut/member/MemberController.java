package kr.co.planbut.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.planbut.common.MemberDTO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO dao;
	
	public MemberController() {
		System.out.println("Start MemberController");
	}
	
	
	/*
	@RequestMapping(value="[요청명령어]", method=RequestMethod.[GET|POST], produces="text/plain; charset='UTF-8'")
	 */
	
	// 플래너 홈
	@RequestMapping(value="member/login.do", method=RequestMethod.GET)
	public ModelAndView loginForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/loginForm");
		
		return mav;
	} // home() end
	
	@RequestMapping(value="member/login.do", method=RequestMethod.POST)
	public ModelAndView loginProc(MemberDTO dto) {
		ModelAndView mav=new ModelAndView();
		String result = dao.login(dto);
		
		System.out.println("로그인 결과(m_type) : " + result);
		if (result.equals("fale")) {
			mav.addObject("msg" , "<p>로그인실패</p>");
			mav.setViewName("member/loginProc");			
		} else {			
			mav.addObject("msg" , "<p>로그인성공</p>");
			mav.setViewName("member/loginProc");			
		}
		
		return mav;
	} // home() end
	
	
	
}