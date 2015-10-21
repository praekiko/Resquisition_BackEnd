package com.softdev

class User {
	int id
	String name
	String telNum
	String barcode
	UserType type

    static constraints = {
    	id nullable: false
    	name blank: false
    	telNum blank: false
    	barcode blank: false
    	type nullable: false
    }

    public String toString() { 
    	"$id ($name)" 
    }
}