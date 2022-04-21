package auth

import grails.compiler.GrailsCompileStatic
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User {

    String username
    String nickname
//    String salt
    String password
    String email
    Date dateChgPwd
    boolean enabled = true
    boolean accountExpired = false
    boolean accountLocked = false
    boolean passwordExpired = false
    String avatar

    Set<Role> getAuthorities() {
        (UserRole.findAllByUser(this) as List<UserRole>)*.role as Set<Role>
    }

    static mapping = {
//        comment '會員帳號'
//        version true

    }

    static constraints = {
        username    (nullable: false, unique: true, maxSize: 255)
        nickname    (nullable: true, maxSize: 1023)
//        salt        (nullable: true)
        password     (nullable: false, blank: false, password: true)
        email       (nullable: true, blank: false, maxSize: 1024, email: true)
        dateChgPwd  (nullable: true)
        avatar (nullable: true)
    }

    static transients = ['authorities']

    def beforeInsert() {

    }

    def beforeUpdate() {

    }
}
