express       = require "express"
stylus        = require "stylus"
nib           = require "nib"
jade_browser  = require "../my_node_modules/jade-browser"
stitch        = require "stitch"


module.exports = (options) =>
  server = express()

  server.use stylus.middleware
    src: options.appRoot 
    dest: options.publicDir
    compile: (str, path) ->
      return stylus(str).set('filename', path).use(nib())

  #client views (JadeTemplates)
  for app in options.clientApps
    server.use(jade_browser(app.templatesUrl, "**", {root:app.localPath}));


    #Client JS
    stitchPackageSite = stitch.createPackage
      paths: [app.localPath]
      
    server.get(app.appUrl, stitchPackageSite.createServer());
  

  #ServerSide views
  server.set('view engine', 'jade')
  server.set('views', options.appRoot)


  #Serve static as public dir
  server.use(express.static(options.publicDir))

  server.express = express
  return server