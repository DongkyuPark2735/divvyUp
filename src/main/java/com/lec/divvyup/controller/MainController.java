package com.lec.divvyup.controller;


<<<<<<< HEAD
=======
import javax.servlet.http.HttpSession;

>>>>>>> 1cdd6702cab83b23a214fd9ec8601e97792e39dd
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
<<<<<<< HEAD

=======
@RequestMapping(value="main")
>>>>>>> 1cdd6702cab83b23a214fd9ec8601e97792e39dd
public class MainController {
	@RequestMapping(value="main", method= {RequestMethod.GET, RequestMethod.POST})
	public String mainView() {
		return "main/main";
	}
<<<<<<< HEAD
	
=======
	@RequestMapping(value="unieTestMain", method= {RequestMethod.GET, RequestMethod.POST})
	public String unieTestMain() {
		return "main/unieTestMain";
	}
	
	@RequestMapping(value="logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:member/loginForm.do";
	}
>>>>>>> 1cdd6702cab83b23a214fd9ec8601e97792e39dd
	

}
