require 'rails_helper'

describe ChannelsController, type: :controller do
  describe 'GET #index' do
    it 'gets a list of channels' do

      get :index

      expect(response).to be_successful
      expect(JSON.parse(response.body).count).to eq(4)
    end
  end

  describe 'GET #show' do
    it 'get a specific channel' do
      channels = Channel.all
      channel = channels.first

      get :show, params: { id: channel.id }

      expect(response).to be_successful
      response_id = JSON.parse(response.body)['channel']['id']
      response_name = JSON.parse(response.body)['channel']['name']
      expect(response_name).to eq (channel[:name])
      expect(response_id).to eq(channel[:id])
    end

    it 'get a message from specific channel' do

      channels = Channel.all
      channel = channels.first
      users = User.all
      user = users.first
      number_of_messages = Message.all.length

      get :show, params: { id: channel.id }

      expect(response).to be_successful
      expect(JSON.parse(response.body)['messages'].length).to eq(number_of_messages)
      expect(JSON.parse(response.body)['messages'].first['channel_id']).to eq(channel.id)
      expect(JSON.parse(response.body)['messages'].first['user_id']).to eq(user.id)
      expect(JSON.parse(response.body)['messages'].first['message']).to eq('Hola')
    end

  end

  describe 'POST #create' do
    it 'creates a duplicate channel' do

      post :create, params: { name: 'Sales' }

      expect(response).to_not be_successful
      expect(JSON.parse(response.body)['message']).to eq ('Channel name already exist')
      expect(JSON.parse(response.body)['status']).to eq(403)
    end
  end

end