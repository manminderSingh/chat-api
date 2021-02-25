class MessagesChannel < ApplicationCable::Channel
  def subscribed
    channel = Channel.find(params[:channel])
    stream_for channel
  end

  # def receive(data)
  #   channel = Channel.find_by(id: data['teamId'])
  #   user = User.find_by(id: data['userId'])
  #   message = team.messages.create(content: data['message'], user: user)
  #   MessageRelayJob.perform_later(message)
  # end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end
end
