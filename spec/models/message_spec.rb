require 'rails_helper'

RSpec.describe Message, type: :model do
  current_user = User.first_or_create!(email: 'micky@example.com', password: 'password', password_confirmation: 'password', username: 'micky')
  channel = Channel.first_or_create!(name: 'Development')
  message = Message.first_or_create!(channel: channel, message: 'Hola', user: current_user)

  it 'has a channel' do
    msg = Message.new(
      channel: nil,
      message: "",
      user: current_user
    )
    expect(msg).to_not be_valid
    msg.channel = channel
    msg.message = "Has a message"
    expect(msg).to be_valid
  end

  it 'has a user' do
    msg = Message.new(
      channel: channel,
      message: "",
      user: nil
    )
    expect(msg).to_not be_valid
    msg.user = current_user
    expect(msg).to be_valid
  end

  it 'check for message field' do
    msg = Message.new(
      channel: channel,
      message: "",
      user: current_user
    )
    expect(msg.message).to eq('')
    msg.message = 'Hi there!'
    expect(msg.message).to_not eq('')
    expect(msg.message).to eq('Hi there!')
  end
end
