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

    public int getRemaining() { 
        return remaining 
    }

    public int setRemaining(int newRemaining) { 
        remaining = newRemaining
    }

    // public Boolean rent(int transactionAmount) { 
    //     Boolean rentStatus
    //     remaining = remaining - transactionAmount
    //     if(remaining > 0){
    //         rentStatus = true
    //     }
    //     rentStatus = false
    //     return rentStatus
    // }
}
