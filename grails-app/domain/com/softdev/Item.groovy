package com.softdev

class Item {
	int id
	String title
	String barcode
    String description
	int remaining

	static hasMany = [transactionItemShips: TransactionItemShips]

    static constraints = {
    	id nullable: false
    	title blank: false
    	barcode blank: false
    	remaining nullable: false
        description blank: true, maxSize: 5000
    }

    public String toString() { 
    	title 
    }
}
