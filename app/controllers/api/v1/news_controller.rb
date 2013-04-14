class Api::V1::NewsController < Api::V1::BaseController
  before_filter :auth_only!, except: [:index, :show]
end
