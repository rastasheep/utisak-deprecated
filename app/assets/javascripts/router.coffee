Vazno.Router.reopen
  location: 'history'

Vazno.Router.map ->
  @resource 'news', ->
    @route 'show', {path: '/:news_id'}
  @resource 'users', ->
    @route 'show', {path: '/:user_id'}
