package com.softdev

class UserRole {
	// int id
	String title

	static hasMany = [users: User]

    static constraints = {
    	// id nullable: false
    	title blank: false
    }

    public String toString() { 
    	title 
    }
}
