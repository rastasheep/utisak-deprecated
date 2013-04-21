Vazno.IndexController = Em.ArrayController.extend
  vote: (news) ->
    url = 'api/v1/news/' + news.id + '/vote'
    Auth.ajax
      url: url
      type: "POST"
      dataType : 'html'
      success: (json, status, jqxhr) =>
        Vazno.News.find()
  userCanVote: 'true'
