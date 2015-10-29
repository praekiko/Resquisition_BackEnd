package com.softdev

import org.joda.time.LocalDateTime
// import org.joda.time.*

class Transaction {
	int id
	LocalDateTime date
	Boolean isApprove
	TransactionType type
    String description

	User user // one user at time
	static hasMany = [transactionItemShips: TransactionItemShips]


    static constraints = {
    	id nullable: false
    	user nullable: false
    	date nullable: false
    	isApprove nullable: false
    	type nullable: false 
        description blank: true, maxSize: 5000
    }

    public String toString() { 
    	"id $id : $user [$type]"
    }
}
