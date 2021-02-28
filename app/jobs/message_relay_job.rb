class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    channel = message.channel
    MessagesChannel.broadcast_to(channel, MessageSerializer.new(message).serialized_json)
  end
end
