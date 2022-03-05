package demo1

import auth.*
import grails.config.Config
import grails.core.support.GrailsConfigurationAware
import grails.validation.ValidationException
import org.apache.commons.lang.RandomStringUtils

import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.NOT_FOUND

class LoginController extends grails.plugin.springsecurity.LoginController implements GrailsConfigurationAware {

    def mailService
    def loginService

//    def index() {
//
//    }

    def auth() {

    }

    /***
     * 會員登入頁面
     * @return
     */
    def signin() {
        respond new User()
    }

    /***
     * 會員登入
     * @param user
     * @return
     */
    def register(User user) {
        if (user == null) {
            notFound()
            return
        }

        def result = loginService.register(user)

        if(result.fail){
            flash.message = result.fail
            respond user.errors, view:'signin'
            return
        }

        assert UserRole.findByUser(user)
        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.username])
        redirect action: 'auth'
    }

    def resetPassword(){

    }

    /***
     * 寄送密碼重製e-mail
     * @return
     */
    def resetPwd(){
        def result = loginService.reserPassword(params)

        if(result.fail){
            flash.message = result.fail
        } else {
            flash.message = g.message(code: 'default.mail.sent.message')
        }

        redirect action: 'auth'

    }

    @Override
    void setConfiguration(Config co) {

    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "auth", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def exceptionHandler(Exception e0){
        println e0
        flash.message = g.message(code: 'default.error.handle.message')
        redirect action: 'auth'
    }

}
