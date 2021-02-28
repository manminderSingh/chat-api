require 'rails_helper'

RSpec.describe Channel, type: :model do
  let!(:current_user) { User.first_or_create!(email: 'micky123@example.com', password: 'password', password_confirmation: 'password', username: 'micky123') }
  channel = Channel.first_or_create!(name: 'Marketing')

  it 'has the correct attributes' do
    message = Message.first_or_create!(channel: channel, message: 'Salut!', user: current_user)
    expect(message.channel_id).to eq(channel.id)
  end
end
