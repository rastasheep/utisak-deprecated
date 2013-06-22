#= require turbolinks
#= require jquery
##= require jquery_ujs
#= require_self

ready = ->
  $("#more-button").click ->
    $(".dropdown-items").toggle()
    $(document).click ->
      $(".dropdown-items").hide()
    return false

  $("#flash").click ->
    $(this).hide()
    return false

$(document).ready(ready)
$(document).on('page:load', ready)
