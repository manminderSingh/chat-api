class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show]

  def index
    channels = Channel.all
    render json: channels, adapter: :attributes, each_serializer: ChannelListSerializer, status: 200
  end

  def show
    channel_messages = @channel.messages.includes(:user) # Channel.messages.includes(:user)
    render json: {messages: channel_messages, channel: @channel}, adapter: :attributes, status: 200
  end

  def create
    channel = Channel.create(channel_params.except(:id))
    if channel.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ChannelSerializer.new(channel)).serializable_hash
      ActionCable.server.broadcast 'conversations_channel', serialized_data
      head :ok
    end
  end

  def set_channel
    @channel = Channel.find(params[:id])
  end

  def channel_params
    strong_params = [:id, :name]
    params.permit(strong_params)
  end

  protected
  def update
    channel = Channel.find(channel_params[:id]) if channel_params[:id]
    if channel.update(channel_params.except(:id))
      render json: channel, status: 201
    else
      render json: { message: 'Invalid parameters'}, status: 422
    end
  end

  def destroy
    channel = Channel.find(channel_params[:id])
    if channel
      channel.destroy
    end
  end

end
