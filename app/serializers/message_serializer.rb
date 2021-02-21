class MessageSerializer
  include JSONAPI::Serializer
  attributes :id, :channel, :message, :created_at, :user
end
