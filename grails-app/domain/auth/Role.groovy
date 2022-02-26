package auth

class Role {

    String authority
    String sName

    static mapping = {
        comment '角色'
        cache true

    }

    static constraints = {
        authority blank: false, unique: true

    }
}
