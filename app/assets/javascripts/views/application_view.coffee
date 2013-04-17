Vazno.ApplicationView = Ember.View.extend
  didInsertElement: ->
    Auth.Module.RememberMe.recall()
