package com.softdev

class TransactionType {
	String title
	
    static constraints = {
    	title blank: false
    }

    public String toString() { 
    	title 
    }
}
