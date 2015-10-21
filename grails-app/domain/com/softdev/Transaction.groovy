package com.softdev

import org.joda.time.LocalDateTime

class Transaction {
	int id
	LocalDateTime date
	Boolean isApprove
	TransactionType type

	//static hasMany = [items: Item]
	//int amount
	User user // one user at time
	static hasMany = [transactionItemShips: TransactionItemShips]

    static constraints = {
    	id nullable: false
    	user nullable: false
    	date nullable: false
    	isApprove nullable: false
    	type nullable: false 
    }

    public String toString() { 
    	type 
    }
}
