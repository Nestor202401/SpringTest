package com.aaa;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller  //P65.77.139
public class Mycontroller1 {

	@GetMapping("/")  //P65.77.139
	public String myMethod1() {
		return "form1";  // --> /src/main/resources/templates/form1.html
	}
	
	@GetMapping("/form2")  //P65.77.139
	public String myMethod2() {
		return "form2";  // --> /src/main/resources/templates/form2.html
	}
	
	@GetMapping("/form3")  //P65.77.139
	@ResponseBody
	public String myMethod3() {
		return "<font color=blue><b>TIA101</b>";  
	}
}
