package com.softdev

class Item {
	int id
	String title
	String barcode
	int remaining

	static hasMany = [transactionItemShips: TransactionItemShips]

    static constraints = {
    	id nullable: false
    	title blank: false
    	barcode blank: false
    	remaining nullable: false
    }

    public String toString() { 
    	title 
    }
}
