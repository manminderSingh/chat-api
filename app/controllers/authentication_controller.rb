class AuthenticationController < ApplicationController
  before_action :authenticate_user!
  def auth
    render json: { 
      message: "This is a private message for #{current_user.email} you should only see if you've got a correct token"
    }
  end
end
