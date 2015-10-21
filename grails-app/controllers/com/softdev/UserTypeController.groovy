package com.softdev



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UserType.list(params), model:[userTypeInstanceCount: UserType.count()]
    }

    def show(UserType userTypeInstance) {
        respond userTypeInstance
    }

    def create() {
        respond new UserType(params)
    }

    @Transactional
    def save(UserType userTypeInstance) {
        if (userTypeInstance == null) {
            notFound()
            return
        }

        if (userTypeInstance.hasErrors()) {
            respond userTypeInstance.errors, view:'create'
            return
        }

        userTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userType.label', default: 'UserType'), userTypeInstance.id])
                redirect userTypeInstance
            }
            '*' { respond userTypeInstance, [status: CREATED] }
        }
    }

    def edit(UserType userTypeInstance) {
        respond userTypeInstance
    }

    @Transactional
    def update(UserType userTypeInstance) {
        if (userTypeInstance == null) {
            notFound()
            return
        }

        if (userTypeInstance.hasErrors()) {
            respond userTypeInstance.errors, view:'edit'
            return
        }

        userTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UserType.label', default: 'UserType'), userTypeInstance.id])
                redirect userTypeInstance
            }
            '*'{ respond userTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UserType userTypeInstance) {

        if (userTypeInstance == null) {
            notFound()
            return
        }

        userTypeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserType.label', default: 'UserType'), userTypeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userType.label', default: 'UserType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
