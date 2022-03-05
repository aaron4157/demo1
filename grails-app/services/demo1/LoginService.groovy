package demo1

import auth.Role
import auth.User
import auth.UserRole
import grails.gorm.transactions.Transactional
import org.apache.commons.lang.RandomStringUtils
import org.springframework.context.i18n.LocaleContextHolder

import javax.xml.bind.ValidationException

@Transactional
class LoginService {

    def messageSource
    def mailService

    def result = [:]

    /***
     * 會員登錄作業
     */
    def register(User user) {

        def userLabel = messageSource.getMessage("user.label", null, LocaleContextHolder.locale)

        if(!user.validate()){
            user.discard()
            result.fail = messageSource.getMessage("default.invalid.message", [userLabel] as Object[], LocaleContextHolder.locale)
            return result
        }

        def user1 = user.save()
        def role = Role.findByAuthority('ROLE_MEMB')
        UserRole.create(user1, role,true)

        result.success = true
        return result
    }

    /***
     * 會員密碼重設作業
     */
    def reserPassword(params) {
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
        result.success = true
        return result
    }

}
