# 建置過程
紀錄架構流程

## 建置基本網頁(無權限控管)

建置基底網頁專案

`grails create-app demo -profile web`

預設運行專案於 localhost:8080/ 也可以自己指定(這裡使用8090)

建置 demo1.homeController 作為入口

`grails create-controller home`




## Spring security 架構 與 資料庫

專案預設引入H2 DB。這是一種記憶體資料庫(in-memory database)，特色是架構彈性，會根據domain自動調整欄位，適合作為概念驗證用途。建議在佈署到生產環境以前，查看H2的資料庫架構，撰寫SQL scripts建立正式資料表。
運行專案後，輸入 /h2-console 即可訪問H2 database。

本專案在開發環境，使用臨時記憶體資料庫。這是揮發性的(vilatile)資料庫物件，重啟專案後，必須重新佈署初始資料。
在測試環境，則使用非揮發性的(non-volatile)檔案資料庫、路徑在專案資料夾下的/data/demo.mv.db。要注意的是，H2 DB同時僅允許一次交易，所以運行專案以前，務必斷開其他占用連線。

### build.gradle 引入spring security core 套件

Spring security 提供三種認證模式
1. 標記。在controller、action加註@annotations 指定可以訪問的角色權限
1. 靜態圖。在 /conf/application.groovy 編寫maps。引入套件後即可見
1. 動態圖。由DB載入，需要指定專用domains。本例使用此方法。

欲指定認證模式，改寫application.groovy的屬性

`grails.plugin.springsecurity.securityConfigType = 'Requestmap'`
 

使用指令集建立認證用domains

`grails s2-quickstart auth User Role Requestmap`

可以看見/domain 底下出現新的auth package、以及三個新的domains。

在auth.User 可以新增自訂的屬性如 nickname。

Spring security 套件提供密碼加密的功能。本例指定登入帳號生成salt；若使用者更改帳號，則必須再次處理密碼，否則無法登入。

```
grails.plugin.springsecurity.password.algorithm = 'bcrypt'
grails.plugin.springsecurity.dao.reflectionSaltSourceProperty = 'username'
```

使用requestmap認證模式，專案初始化之時必須載入預設權限與使用者。內容記載於 /init/Bootstrap.groovy

再次運行專案，可以發現訪問/club 與 /h2-console 將會重導至登入頁面。這樣，就完成基本的權限設定。

登出功能預設為POST。必須在頁面中放置form元素、登出為submit按鈕。雖然，可以在application.groovy修改設置

`grails.plugin.springsecurity.logout.postOnly = false`

修改後，可以使用點擊連結方式做登出；不過，官方並不推薦此方法，理由是安全性較低。

會員註冊功能，由loginController改寫擴充而成，畫面則是參考user/create加以修改。

## 建置動態網頁

安裝Node.js後，可以在console使用npm命令。運行

`$npm install sweetalert2`

### Taglib
Grails 3 版本以後，使用標籤`<f:all>`取代模板`_form.gsp`；欲自訂表單版面，則在`views` 資料夾底下建立欄位單元模板，路徑如下
`views/_fields/default/_wrapper.gsp
views/_fields/string/_wrapper.gsp 
views/_fields/date/_wrapper.gsp`

### 網頁模板的修改
在不使用gulp.js管理連端資源的情況下，要做以下調整
1. vendor.bundle.base.js 上移到head區域，在網頁編譯早期就引入 jQuery
1. typicons.css 上移到head 區域，及時載入字型
1. dashboard.js 引用的JSON來源，改由home/dataFetch提供

整合bootstrap功能，成為網頁的工具箱

## 參考資料
* [Grails 4](https://docs.grails.org/4.0.12/guide/single.html#gettingStarted)
* [Spring security core](https://grails.github.io/grails-spring-security-core/4.0.x/index.html#gettingStarted)
* [H2 Database](http://www.h2database.com/html/tutorial.html#connection_pool)
* [H2 file-db](https://www.baeldung.com/h2-embedded-db-data-storage)
* [Grails mail](https://www.djamware.com/post/58b50fee80aca736bb5e4369/grails-3-send-email-example#grails-mail-plugin)
* [Sweetalert2](https://sweetalert2.github.io/)
* [Grails field tag](https://grails-fields-plugin.github.io/grails-fields/latest/ref/Tags/all.html)
* [網頁模板](https://themewagon.com/?swoof=1&post_type=product&pa_frameworks=bootstrap-4&paged=1&pa_price=free)