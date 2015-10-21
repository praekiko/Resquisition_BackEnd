package com.softdev



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TransactionTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TransactionType.list(params), model:[transactionTypeInstanceCount: TransactionType.count()]
    }

    def show(TransactionType transactionTypeInstance) {
        respond transactionTypeInstance
    }

    def create() {
        respond new TransactionType(params)
    }

    @Transactional
    def save(TransactionType transactionTypeInstance) {
        if (transactionTypeInstance == null) {
            notFound()
            return
        }

        if (transactionTypeInstance.hasErrors()) {
            respond transactionTypeInstance.errors, view:'create'
            return
        }

        transactionTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'transactionType.label', default: 'TransactionType'), transactionTypeInstance.id])
                redirect transactionTypeInstance
            }
            '*' { respond transactionTypeInstance, [status: CREATED] }
        }
    }

    def edit(TransactionType transactionTypeInstance) {
        respond transactionTypeInstance
    }

    @Transactional
    def update(TransactionType transactionTypeInstance) {
        if (transactionTypeInstance == null) {
            notFound()
            return
        }

        if (transactionTypeInstance.hasErrors()) {
            respond transactionTypeInstance.errors, view:'edit'
            return
        }

        transactionTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TransactionType.label', default: 'TransactionType'), transactionTypeInstance.id])
                redirect transactionTypeInstance
            }
            '*'{ respond transactionTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TransactionType transactionTypeInstance) {

        if (transactionTypeInstance == null) {
            notFound()
            return
        }

        transactionTypeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TransactionType.label', default: 'TransactionType'), transactionTypeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'transactionType.label', default: 'TransactionType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
