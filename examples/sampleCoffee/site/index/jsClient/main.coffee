console.log "weee"
view1 = require('app/view1/view1').view1

class Main
  views:{}
  
  constructor: ->
    @views.view1 = new view1()

  renderView1: =>
    @views.view1.render()


$(document).ready ->
  window.app = new Main()
  window.app.renderView1()