class Message < ApplicationRecord
  belongs_to :channel, inverse_of: :messages
  belongs_to :user
end
