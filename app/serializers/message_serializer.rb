class MessageSerializer
  include JSONAPI::Serializer
  attributes :message, :id, :created_at, :user_id, :channel_id
end
