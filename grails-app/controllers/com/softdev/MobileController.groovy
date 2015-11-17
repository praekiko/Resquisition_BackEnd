package com.softdev



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MobileController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        //params.max = Math.min(max ?: 10, 100)
        //respond Transaction.list(params), model:[transactionInstanceCount: Transaction.count()]
    }

    def show(Transaction transactionInstance) {
    	// print params
        respond transactionInstance
    }

    def create() {
        respond new Transaction(params)
    }

    @Transactional
    def save(Transaction transactionInstance) {
        print params.user
        // print User.get(1)
        def result = User.findByBarcode(params.user.barcode)
        transactionInstance.user.id = result.id
        print transactionInstance
        
        if (transactionInstance == null) {
            notFound()
            return
        }

        if (transactionInstance.hasErrors()) {
            respond transactionInstance.errors, view:'create'
            return
        }

        transactionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'transaction.label', default: 'Mobile'), transactionInstance.id])
                // redirect transactionInstance
                // redirect (action: "show", id: transactionInstance.id)
                redirect (action: "addItem", params: ["transaction.id": transactionInstance?.id])
            }
            '*' { respond transactionInstance, [status: CREATED] }
        }
    }

    def addItem(){
        respond new TransactionItemShips(params)
    }

    def saveItem(TransactionItemShips transactionItemShipsInstance) {
        if (transactionItemShipsInstance == null) {
            notFound()
            return
        }

        if (transactionItemShipsInstance.hasErrors()) {
            respond transactionItemShipsInstance.errors, view:'create'
            return
        }

        //update remaining value in Item class
        def item = Item.findByBarcode(params.item.barcode as String)
        transactionItemShipsInstance.item.id = item.id
        def transactionAmount = transactionItemShipsInstance.amount
        if(item.rent(transactionAmount)){
            item.save()     
            transactionItemShipsInstance.save flush:true
        }
        else {
            // alert
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'transactionItemShips.label', default: 'TransactionItemShips'), transactionItemShipsInstance.id])
                // redirect transactionItemShipsInstance
                redirect (action: "edit", id: transactionItemShipsInstance.transaction.id)
            }
            '*' { respond transactionItemShipsInstance, [status: CREATED] }
        }
    }

    def edit(Transaction transactionInstance) {
    	// print "Edit from Mobile"
    	// print params
    	// print transactionInstance
        respond transactionInstance
    }

    @Transactional
    def update(Transaction transactionInstance) {
        // print params
        // print "-------"
        println 'asdlkfjsldkfjlk'
        print transactionInstance
        if (transactionInstance == null) {
            notFound()
            return
        }

        if (transactionInstance.hasErrors()) {
            respond transactionInstance.errors, view:'edit'
            return
        }

        transactionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Transaction.label', default: 'Transaction'), transactionInstance.id])
                redirect(action: "show", id: transactionInstance.id)
            }
            '*'{ respond transactionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Transaction transactionInstance) {

        if (transactionInstance == null) {
            notFound()
            return
        }

        transactionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Transaction.label', default: 'Transaction'), transactionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'transaction.label', default: 'Transaction'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
}
