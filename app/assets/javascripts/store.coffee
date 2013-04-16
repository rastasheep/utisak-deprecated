Vazno.Store = DS.Store.extend
  revision: 11
  adapter: Auth.RESTAdapter.create
    url: '/api/v1'
    plurals: "news"
