class MessagesController < ApplicationController
  # before_action :load_entities

  def index
    messages = Message.all
    render json: messages, adapter: :attributes, status: 200
  end

  def create
    user = User.find(params[:user_id])
    channel = Channel.find(params[:channel_id])
    if user && channel
      message = Message.create({user: user, channel: channel, message: params[:message]})
      if message.save
        serialized_data = ActiveModelSerializers::Adapter::Json.new
        (MessageSerializer.new(message)).serializable_hash
        MessagesChannel.broadcast_to channel, serialized_data
        head :ok
      end
    end
  end

  def message_params
    params.permit([:message, :user_id, :channel_id])
  end

  protected
  def load_entities
    @channel = Channel.find(params[:channel_id])
  end
  
  
end
