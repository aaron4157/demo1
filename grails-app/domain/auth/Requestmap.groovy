package auth

import org.springframework.http.HttpMethod

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes=['configAttribute', 'httpMethod', 'url'])
@ToString(includes=['configAttribute', 'httpMethod', 'url'], cache=true, includeNames=true, includePackage=false)
class Requestmap implements Serializable {

	private static final long serialVersionUID = 1

	String configAttribute //權限角色:'permitAll','ROLE_XXX','isRememberMe','isFullyAuthenticated'
	HttpMethod httpMethod
	String url //權限路徑

	static constraints = {
		configAttribute nullable: false, blank: false
		httpMethod nullable: true
		url nullable: false, blank: false, unique: 'httpMethod'
	}

	static mapping = {
//		cache true
	}
}
