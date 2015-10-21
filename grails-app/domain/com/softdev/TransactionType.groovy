package com.softdev

class TransactionType {
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
