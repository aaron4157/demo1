package demo1

import auth.Requestmap
import auth.Role
import auth.User
import auth.UserRole
import grails.gorm.transactions.Transactional
import grails.util.Environment

class BootStrap {
    def springSecurityService

    def init = { servletContext ->
        if(Environment.current == Environment.DEVELOPMENT) {
            addTestUser()
            buildRequestMap()
        } else {
            springSecurityService.clearCachedRequestmaps()
        }

    }
    def destroy = {
    }

    @Transactional
    void addTestUser() {
        def adminRole = new Role(authority: 'ROLE_ADMIN', sName: 'admin').save()

        def testUser = new User(username: 'me', password: 'password').save()

        UserRole.create testUser, adminRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }

        if(Environment.current == Environment.DEVELOPMENT){
            new Role(authority: 'ROLE_MEMB', sName: 'member').save(flush:true)
        }

        assert User.count() == 1
        assert Role.count() == 2
        assert UserRole.count() == 1

    }

    void buildRequestMap(){
        for (String url in [
                '/', '/error', '/index', '/index.gsp', '/**/favicon.ico', '/shutdown',
                '/assets/**', '/**/js/**', '/**/css/**', '/**/images/**',
                '/login', '/login.*', '/login/*',
                '/logout', '/logout.*', '/logout/*', '/home/*']) {
            new Requestmap(url: url, configAttribute: 'permitAll').save()
        }
        new Requestmap(url: '/user/**',      configAttribute: 'ROLE_ADMIN,IS_AUTHENTICATED_FULLY').save()
        new Requestmap(url: '/club/**',      configAttribute: 'ROLE_ADMIN,ROLE_MEMB').save()
        new Requestmap(url: '/h2-console/**',      configAttribute: 'ROLE_ADMIN').save()
        springSecurityService.clearCachedRequestmaps()
    }
}
