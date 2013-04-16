Vazno.NewsIndexRoute = Em.Route.extend
  model: ->
    Vazno.News.find()
