class ChannelsChannel < ApplicationCable::Channel
  def subscribed
    # channel = Channel.find(params[:channel])
    # stream_for channel
    stream_from "conversations_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
