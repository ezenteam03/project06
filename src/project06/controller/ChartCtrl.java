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
	
	// http://localhost:6080/project06_git/chart.do?method=pm
	@RequestMapping(params="method=pm")
	public String chartpm(Model d) {
		d.addAttribute("chartlist", service.chartList());
		return "WEB-INF\\views\\main\\chartpm.jsp";
	}
	
	// http://localhost:6080/project06_git/chart.do?method=tm
	@RequestMapping(params="method=tm")
	public String charttm(Model d) {
		d.addAttribute("chartlist", service.chartList());
		return "WEB-INF\\views\\main\\charttm.jsp";
	}
	
	// http://localhost:6080/project06_git/chart.do?method=ajaxdata
	@RequestMapping(params="method=ajaxdata")
	public String chtData(Model d) {
		d.addAttribute("chartlist", service.chartList());
		return "pageJsonReport";
	}
}
