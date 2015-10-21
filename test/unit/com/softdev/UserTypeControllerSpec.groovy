package com.softdev



import grails.test.mixin.*
import spock.lang.*

@TestFor(UserTypeController)
@Mock(UserType)
class UserTypeControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.userTypeInstanceList
            model.userTypeInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.userTypeInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def userType = new UserType()
            userType.validate()
            controller.save(userType)

        then:"The create view is rendered again with the correct model"
            model.userTypeInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            userType = new UserType(params)

            controller.save(userType)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/userType/show/1'
            controller.flash.message != null
            UserType.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def userType = new UserType(params)
            controller.show(userType)

        then:"A model is populated containing the domain instance"
            model.userTypeInstance == userType
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def userType = new UserType(params)
            controller.edit(userType)

        then:"A model is populated containing the domain instance"
            model.userTypeInstance == userType
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/userType/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def userType = new UserType()
            userType.validate()
            controller.update(userType)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.userTypeInstance == userType

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            userType = new UserType(params).save(flush: true)
            controller.update(userType)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/userType/show/$userType.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/userType/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def userType = new UserType(params).save(flush: true)

        then:"It exists"
            UserType.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(userType)

        then:"The instance is deleted"
            UserType.count() == 0
            response.redirectedUrl == '/userType/index'
            flash.message != null
    }
}
