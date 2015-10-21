package com.softdev

class UserType {
	int id
	String title

    static constraints = {
    	id nullable: false
    	title blank: false
    }

    public String toString() { 
    	title 
    }
}
