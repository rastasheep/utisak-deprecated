Vazno.IndexRoute = Em.Route.extend
  model: ->
    Vazno.News.find()
