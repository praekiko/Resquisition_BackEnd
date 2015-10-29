package com.softdev



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TransactionItemShipsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TransactionItemShips.list(params), model:[transactionItemShipsInstanceCount: TransactionItemShips.count()]
    }

    def show(TransactionItemShips transactionItemShipsInstance) {
        respond transactionItemShipsInstance
    }

    def create() {
        respond new TransactionItemShips(params)
    }

    @Transactional
    def save(TransactionItemShips transactionItemShipsInstance) {
        if (transactionItemShipsInstance == null) {
            notFound()
            return
        }

        if (transactionItemShipsInstance.hasErrors()) {
            respond transactionItemShipsInstance.errors, view:'create'
            return
        }

        //update remaining value in Item class
        def item = Item.get(params.item.id)
        def transactionAmount = transactionItemShipsInstance.amount
        def currentRemaining = item.getRemaining()
        currentRemaining = currentRemaining - transactionAmount
        item.setRemaining(currentRemaining)
        // item.rent(transactionAmount)
        item.save() 

        transactionItemShipsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'transactionItemShips.label', default: 'TransactionItemShips'), transactionItemShipsInstance.id])
                redirect transactionItemShipsInstance
            }
            '*' { respond transactionItemShipsInstance, [status: CREATED] }
        }
    }

    def edit(TransactionItemShips transactionItemShipsInstance) {
        respond transactionItemShipsInstance
    }

    @Transactional
    def update(TransactionItemShips transactionItemShipsInstance) {
        if (transactionItemShipsInstance == null) {
            notFound()
            return
        }

        if (transactionItemShipsInstance.hasErrors()) {
            respond transactionItemShipsInstance.errors, view:'edit'
            return
        }

        transactionItemShipsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TransactionItemShips.label', default: 'TransactionItemShips'), transactionItemShipsInstance.id])
                redirect transactionItemShipsInstance
            }
            '*'{ respond transactionItemShipsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TransactionItemShips transactionItemShipsInstance) {

        if (transactionItemShipsInstance == null) {
            notFound()
            return
        }

        transactionItemShipsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TransactionItemShips.label', default: 'TransactionItemShips'), transactionItemShipsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'transactionItemShips.label', default: 'TransactionItemShips'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
