package com.softdev

class TransactionItemShips {
	Transaction transaction
	Item item
	int amount

    static constraints = {
    	transaction nullable: false
    	item nullable: false
    	amount nullable: false
    }

    public String toString() { 
    	"$item $amount" 
    }

}
