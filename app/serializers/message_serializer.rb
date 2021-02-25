class MessageSerializer < ActiveModel::Serializer
  attributes :message, :id, :created_at, :user_id, :channel_id
end
