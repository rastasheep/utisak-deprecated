Vazno.Router.reopen
location: 'history'

Vazno.Router.map ->
  @resource 'posts', ->
    @route 'show', {path: '/:post_id'}
  @resource 'users', ->
    @route 'show', {path: '/:user_id'}
