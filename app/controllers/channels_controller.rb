class ChannelsController < ApplicationController

  # Loads:
  # channels = all channels
  # channel = current channels when applicable
  # before_action :load_entities

  def index
    channels = Channel.all
    render json: channels, adapter: :attributes, status: 200
  end

  def show
    channel_messages = Channel.messages.includes(:user)
    render json: channel_messages, adapter: :attributes, status: 200
  end

  def create
    channel = Channel.new(channel_params.except(:id))
    if channel.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ChannelSerializer.new(channel)
      ).serializable_hash
      ActionCable.server.broadcast 'conversations_channel', serialized_data
      head :ok
  end

  def update
    channel = Channel.find(channel_params[:id]) if channel_params[:id]
    if channel.update(channel_params.except(:id))
      render json: channel, status: 201
    else
      render json: { message: 'Invalid parameters'}, status: 422
    end
  end

  def load_entities
    channels = Channel.all
    channel = Channel.find(params[:id]) if params[:id]
  end

  def channel_params
    params.require(:channel).permit(:name)
  end
end
