package com.softdev

import org.joda.time.LocalDateTime

class Transaction {
	LocalDateTime date
	Boolean isApprove
	// TransactionType type
    String description

	User user // one user at time
	static hasMany = [transactionItemShips: TransactionItemShips]


    static constraints = {
    	user nullable: false
    	date nullable: false
    	isApprove nullable: false
    	// type nullable: false 
        description nullable: true, maxSize: 5000
    }

    static mapping = {
        transactionItemShips cascade: 'all-delete-orphan'
    }

    public String toString() { 
        // "ID $id : $user [$type]"
    	"ID $id : $user"
    }
}
