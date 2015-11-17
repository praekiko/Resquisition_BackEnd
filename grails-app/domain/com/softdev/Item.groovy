package com.softdev

class Item {
	// int id
	String barcode
    String title
    String unit
    int remaining
    String description

	static hasMany = [transactionItemShips: TransactionItemShips]

    static mapping = {
        // id name: 'barcode'
        // id column: 'barcode', type: 'String'
        // id column: 'barcode'
    }

    static constraints = {
    	// id nullable: false
    	barcode blank: false
        title blank: false
        unit blank: false
    	remaining nullable: false
        description blank: true, maxSize: 5000
    }

    public String toString() { 
    	barcode
    }

    public boolean rent(int transactionAmount){
        if(this.remaining >= transactionAmount){
            this.remaining -= transactionAmount   
            return true         
        }
        else {
            println "Amount is invalid"
            return false
        }
    }

    public boolean addOldAmountBeforeEdit(int oldAmount){
        this.remaining += oldAmount
        return true
    }
}
