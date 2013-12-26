package com.eshop.tool;

public class SubString {
	private  String name;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMerchandise(String name){
		return name.length() > 7? name.substring(0, 7).concat("...") : name;
	}
}
