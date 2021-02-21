class MessagesController < ApplicationController
  before_action :load_entities

  def create
    message = Message.new({user: current_user, channel: Channel.find(params[:channel], message: params[:message])})
    channel = Channel.find(message_params[:channel_id])
    # message = Message.create({user: current_user, channel: params[:channel], message: params[:message]})
    if (message.save)
      serialized_data = ActiveModelSerializers::Adapter::JSON.new(MessageSerializer.new(message)).serializable_hash
      MessagesChannel.broadcast_to channel, serialized_data
      head: ok    
  end

  protected

  def load_entities
    @channel = Channel.find params.dig(:message, :channel_id)
  end

  private
  
  def message_params
    params.require(:message).permit(:message, :channel, :user,  :channel_id)
  end
end
