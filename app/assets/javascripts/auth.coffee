Auth.Config.reopen
  urlAuthenticationParamsKey: 'auth'
  tokenCreateUrl: '/users/sign_in'
  tokenDestroyUrl: '/users/sign_out'
  tokenKey: 'auth_token'
  idKey: 'user_id'
  userModel: Vazno.User
  rememberMe: true
  rememberTokenKey: 'remember_token'
  rememberPeriod: 14 # days
  rememberAutoRecall: true
  signInRedirectFallbackRoute: 'index'
