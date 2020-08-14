package com.park.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IParkAction {
	public ParkActionForward execute(HttpServletRequest request, HttpServletResponse response);
}
