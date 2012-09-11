shmeck
======

Web framework

Usage
--------------
coffeescript:

    app = new shmeck
      appName:"firstApp"
      appRoot: "#{__dirname}/site"
      publicDir: "#{__dirname}/public"
      clientApps : [
        localPath: "#{__dirname}/site/index/jsClient"
        appUrl: "/jsClient.js"
        templatesUrl: "/jsClientTemplates.js"
      ,
        localPath: "#{__dirname}/site/backoffice"
        appUrl: "/bo.js"
        templatesUrl: "/boTemplates.js"
      ]

javascript:

    var app = new shmeck({
        appName:"firstApp",
        appRoot:"/site",
        publicDir: __dirname + "/public"
        clientApps:[
          {
            locaPath: "",
            appUrl: "",
            templatesUrl: ""
          }, {
            locaPath: "",
            appUrl: "",
            templatesUrl
          }
        ]
        
      })
     

      