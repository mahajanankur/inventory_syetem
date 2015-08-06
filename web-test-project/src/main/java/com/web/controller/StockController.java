/**
 * 
 */
package com.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author ankur
 * 
 */
@Controller
@RequestMapping(value = "/nc")
//working
public class StockController {

	@RequestMapping(value = "/testMap", method = RequestMethod.GET)
	public String redirectToStockList(
	/* @RequestParam(value = "pCatName", defaultValue = "") String a */) {
		System.out.println("On other Controller..!!");
		System.out.println("redirected to Stock List page !!");
		return "SampleTamplate";
	}
}
