Vazno.CommentsRoute = Em.Route.extend(
  setupController: (controller, model) ->
    comments = @controllerFor("news").get("comments")
    controller.set "content", comments

  renderTemplate: ->
    @render into: "news.show"
)
