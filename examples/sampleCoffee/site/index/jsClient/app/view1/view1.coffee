class exports.view1 extends Backbone.View
  render: =>
    $("#teste").before(jade.render('app/view1/view1', {}))