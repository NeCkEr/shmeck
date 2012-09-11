shmeck = require("../../lib/shmeck")

simpleExample = shmeck
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

#Configuration of the server normally as was a express server
simpleExample.use(simpleExample.express.bodyParser({ keepExtensions: true, uploadDir: __dirname + "/upload" }))
simpleExample.use(simpleExample.express.cookieParser("cookie secret!"))
simpleExample.use(simpleExample.router)


simpleExample.get '/', require("./site/index/index")

simpleExample.listen process.env.PORT or 4000