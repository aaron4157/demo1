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

        try {
            UserRole.withTransaction { status ->
                def role = Role.findByAuthority('ROLE_MEMB')
                def user1 = user.save()
                UserRole.create(user1, role,true)
            }

        } catch (ValidationException e) {
            respond user.errors, view:'signin'
            return
        }

        assert UserRole.findByUser(user)
        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.username])
        redirect action: 'auth'
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.username])
//                redirect user
//            }
//            '*' { respond user, [status: CREATED] }
//        }
    }

    def resetPassword(){

    }

    /***
     * 寄送密碼重製e-mail
     * @return
     */
    def resetPwd(){
//        println params
        try {
            User.withTransaction {
                def user = auth.User.findByUsernameAndEmail(params.username, params.email)
                if(!user) throw new Exception("帳號驗證錯誤，信件無法寄出")
                // 產生8位數隨機密碼
                def allChars = ['A'..'Z', 'a'..'z', '0'..'9' ].flatten() - ['O', '0', 'l', '1', 'I' ]
                def newPassword = RandomStringUtils.random(8, allChars as char[])

                user.password = newPassword
                user.dateChgPwd = new Date()
                user.save(flush:true)

                mailService.sendMail {
                    to user.email
                    subject '密碼重置提醒'
                    html """
                    <h1>親愛的會員${user.username}您好</h1>
                    <p>您在以下時間 ${new Date().toString()}成功重置您的登入密碼。新的密碼是:</p>
                    <p>${newPassword}</p>
                    <p>請盡速登入並更新您的密碼！</p>
                    <p>如有任何問題，請聯繫客服人員，謝謝</p>
                    """
                }
            }

            flash.message = g.message(code: 'default.mail.sent.message')

        }
        catch (ValidationException e) {
            println e
            flash.message = "使用者資料有誤，請聯繫客服人員處理"

        }
        catch (Exception e0) {
            println e0
            flash.message = e0.toString()
        }
        finally {

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
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

}
