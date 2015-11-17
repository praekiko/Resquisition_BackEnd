package com.softdev

class User {
	// int id
    String barcode
    String username
    String password
    String name
    String telNum
    // Boolean isPersonnel
	UserRole type

    static mapping = {
        // id name: 'barcode'
        // id column: 'barcode', generator: 'assigned'
    }

    static constraints = {
    	// id nullable: false
    	barcode blank: false
        username blank: false
        password blank: false
        name blank: false
        telNum blank: false
    	type nullable: false
    }

    public String toString() { 
    	barcode 
    }
}
