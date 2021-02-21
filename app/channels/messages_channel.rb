class MessagesChannel < ApplicationCable::Channel
  def subscribed
    channel = Channel.find(params[:channel])
    stream_for channel
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
