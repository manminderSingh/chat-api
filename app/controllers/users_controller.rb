class UsersController < ApplicationController
  def index
    users = User.all
    render json: users, adapter: :attributes, each_serializer: UserIndexSerializer, status: 200
  end
end
