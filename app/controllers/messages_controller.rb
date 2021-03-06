class MessagesController < ApplicationController

  def index
    messages = Message.all
    render json: messages, adapter: :attributes, status: 200
  end

  def create
    user = User.find(params[:user_id])
    channel = Channel.find(params[:channel_id])
    if user && channel
      message = Message.new({user: user, channel: channel, message: params[:message]})
      if message.save
        serialized_data = ActiveModelSerializers::Adapter::Json.new(
          MessageSerializer.new(message)).serializable_hash
        ActionCable.server.broadcast 'messages_channel', serialized_data
        head :ok
      end
    end
  end

  def message_params
    params.permit([:id, :message, :user_id, :channel_id])
  end

  protected
  def destroy
    message = Message.find(params[:id])
    if message
      message.destroy
    end
  end
  
end
