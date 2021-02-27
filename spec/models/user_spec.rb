require 'rails_helper'

RSpec.describe User, type: :model do
  current_user = User.new(email: 'micky456@example.com', password: 'password', password_confirmation: 'password', username: 'nicky')
  
  it 'has a valid username' do
    user = User.new(
      email: 'micky456@example.com',
      password: 'password', 
      password_confirmation: 'password',
      username: ''
    )
    expect(user).to_not be_valid
    user.username = 'nicky'
    expect(user).to be_valid
    expect(user.username).to eq(current_user.username)
  end

  
end