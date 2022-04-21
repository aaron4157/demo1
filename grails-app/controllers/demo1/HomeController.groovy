package demo1

import grails.converters.JSON
import groovy.json.JsonSlurper

class HomeController {

    def index() {
        render view: '/index'
    }

    def page0() {
        render template: '/home/page0'
    }

    /***
     * pages/ui-features/buttons.html
     * */
    def a1() {
        render template: '/home/ui-features/buttons'
    }

    /***
     * pages/ui-features/dropdowns.html
     */
    def a2() {
        render template: '/home/ui-features/dropdowns'
    }

    /***
     * pages/ui-features/typography.html
     */
    def a3() {
        render template: '/home/ui-features/typography'
    }

    /***
     * pages/forms/basic_elements.html
     * @return
     */
    def b1() {
        render template: '/home/forms/basicElements'
    }

    /***
     * pages/charts/chartjs.html
     */
    def c1() {
        render template: '/home/charts/chartjs'
    }

    /***
     * pages/tables/basic-table.html
     * */
    def d1() {
        render template: '/home/tables/basicTable'
    }

    /***
     * pages/icons/mdi.html
     */
    def e1() {
        render template: '/home/icons/mdi'
    }

    /***
     * pages/samples/login.html
     */
    def f1() {
        render view: '/home/samples/loginPage'
    }

    /***
     * pages/samples/register.html
     */
    def f2() {
        render view: '/home/samples/registerPage'
    }

    /***
     * pages/samples/error-404.html
     */
    def f3() {
        render status: '404'
    }

    /***
     * pages/samples/error-500.html
     */
    def f4() {
        render status: '500'
    }

    def dataFetch(){
        def baseFolder = "C:\\Programing\\demo1\\src\\main\\webapp"
        def dataFile = new File(baseFolder+'\\assets\\js\\data.txt')
        def dataJSON = new JsonSlurper().parse(dataFile, 'utf-8')
        render dataJSON  as JSON
    }
}
