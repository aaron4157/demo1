package demo1

import auth.Role
import auth.User
import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class LoginControllerSpec extends Specification implements ControllerUnitTest<LoginController> {

    def setup() {
    }

    def cleanup() {
    }

    void "test registration"() {
        when: "a user is registreing"
            def user = new User(username: 'test', password: 'testy')
            controller.register(user)

        then:"success message is returnd"
            flash.get('message') != null
            User.count == 2
    }
}
