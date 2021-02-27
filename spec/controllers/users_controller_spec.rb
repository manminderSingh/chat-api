require 'rails_helper'

describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'gets a list of users' do
      number_of_users = User.all.length

      get :index

      expect(response).to be_successful
      expect(JSON.parse(response.body).count).to eq(number_of_users)
    end

    it 'gets the first record of user' do
      user = User.all.first

      get :index

      expect(response).to be_successful
      expect(JSON.parse(response.body).first['username']).to eq(user.username)  
    end
  end
end
