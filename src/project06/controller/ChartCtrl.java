package project06.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project06.service.ChartService;

@Controller
@RequestMapping("/chart.do")
public class ChartCtrl {
	@Autowired(required=false)
	private ChartService service;
	
	// http://localhost:6080/project06_git/chart.do?method=main
	@RequestMapping(params="method=main")
	public String list(Model d) {
		d.addAttribute("chartlist", service.chartList());
		return "WEB-INF\\views\\main\\chart.jsp";
	}
	
	// http://localhost:6080/project06_git/chart.do?method=ajaxdata
	@RequestMapping(params="method=ajaxdata")
	public String calData(Model d) {
		d.addAttribute("chartlist", service.chartList());
		return "pageJsonReport";
	}
}
