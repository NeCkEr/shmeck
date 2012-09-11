express       = require "express"
stylus        = require "stylus"
nib           = require "nib"
jade_browser  = require "../my_node_modules/jade-browser"
stitch        = require "stitch"


module.exports = (options) =>
  server = express()

  server.use stylus.middleware
    src: options.appRoot + "/site"
    dest: options.appRoot + "/public"
    compile: (str, path) ->
      return stylus(str).set('filename', path).use(nib())

  #client JadeTemplates
  server.use(jade_browser('/clientAppTemplates.js', "**", {root:options.appRoot + "/site/clientApp"}));


  #Client JS 
  stitchPackageSite = stitch.createPackage
    paths: [options.appRoot + '/site/clientApp']

  server.get('/app.js', stitchPackageSite.createServer());

  server.set('view engine', 'jade')
  server.set('views', options.appRoot + '/site' )

  server.use(express.static(options.appRoot + '/public'))

  server.use(express.bodyParser({ keepExtensions: true, uploadDir: __dirname + "/upload" }))
  server.use(express.cookieParser("cookie secret!"))
  server.use(server.router)

  return server