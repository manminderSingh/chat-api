require 'rails_helper'

describe MessagesController, type: :controller do

  describe 'GET #index' do
    it 'gets a list of messages' do
      number_of_messages = Message.all.length
      get :index
      expect(response).to be_successful
      expect(JSON.parse(response.body).count).to eq(number_of_messages)
    end
  end

  describe 'POST #create' do
    it 'creates a message' do

      channel = Channel.all.first
      user = User.all.first

      post :create, params: { message: 'Salut!', channel_id: channel.id, user_id: user.id }

      expect(response).to be_successful
    end
  end

end