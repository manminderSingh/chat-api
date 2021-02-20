class Channel < ApplicationRecord

  # :inverse_of option is a method for avoiding SQL queries, not generating them. 
  # It's a hint to ActiveRecord to use already loaded data instead of fetching it again through a relationship.
  has_many :messages, dependent: :destroy, inverse_of: channel
end
