class Api::V1::UsersController < Api::V1::BaseController
  before_filter :auth_only!
end
