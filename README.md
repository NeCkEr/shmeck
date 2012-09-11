shmeck
======

Web framework

Usage
--------------
coffeescript:

    app = new shmeck
      appname:"firstApp"
      approot:"/site"

      clientApps: [
        "client_app": "/app.js"
        "/index/clientjs": "index.js"
      ]


javascript:

    var app = new shmeck({
        appname:"firstApp",
        approot:"/site",
        clientApps: [
          "client_app": "/app.js",
          "/index/clientjs": "index.js",
        ]
      })
     

      