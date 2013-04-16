Vazno.PostsShowRoute = Em.Route.extend
  serialize: (model) ->
    newst_id: model.get 'param'
