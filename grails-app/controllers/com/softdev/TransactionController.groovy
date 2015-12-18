package com.softdev



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

// @Transactional(readOnly = true)
@Transactional(readOnly = false)
class TransactionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        // println params.isAprrove
        // def searchResultList = Transaction.createCriteria().list() {
        //     if(params.isAprrove){
        //         like("isAprrove", params.isAprrove)
        //         maxResults(10)
        //         order("isAprrove", "desc")
        //     }
            
        // }

        // println searchResultList

        // respond searchResultList, model:[transactionInstanceCount: searchResultList.size()]

        respond Transaction.list(params), model:[transactionInstanceCount: Transaction.count()]
    }

    def show(Transaction transactionInstance) {
        respond transactionInstance
    }

    def create() {
        respond new Transaction(params)
    }

    @Transactional
    def save(Transaction transactionInstance) {
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
                flash.message = message(code: 'default.created.message', args: [message(code: 'transaction.label', default: 'Transaction'), transactionInstance.id])
                redirect transactionInstance
            }
            '*' { respond transactionInstance, [status: CREATED] }
        }
    }

    def edit(Transaction transactionInstance) {
        respond transactionInstance
    }

    @Transactional
    def update(Transaction transactionInstance) {
        // print transactionInstance
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
                redirect transactionInstance
            }
            '*'{ respond transactionInstance, [status: OK] }
        }
    }

    def updateIsApprove(Transaction transactionInstance) {
        println transactionInstance
        if (transactionInstance == null) {
            notFound()
            return
        }

        if (transactionInstance.hasErrors()) {
            respond transactionInstance.errors, view:'edit'
            return
        }

        print transactionInstance.isApprove
        if(transactionInstance.isApprove == false){
            transactionInstance.isApprove = true
            // forward action: "update"
            transactionInstance.save flush:true
            redirect action: "index"
            return
        }

        // transactionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Transaction.label', default: 'Transaction'), transactionInstance.id])
                // redirect transactionInstance
                // redirect (action: "index", params: [max: 100])
                // redirect action:"index", method:"GET"
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
        transactionInstance.transactionItemShips.each { transactionItemShipsInstance ->
            print transactionItemShipsInstance
            //update remaining value in Item class
            def item = Item.get(transactionItemShipsInstance.item.id)
            def transactionAmount = transactionItemShipsInstance.amount
            print transactionAmount
            if(item.addRemaing(transactionAmount)){
                // item.save()     
                // transactionItemShipsInstance.delete flush:true
            }
            else {
                // alert
            }
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
