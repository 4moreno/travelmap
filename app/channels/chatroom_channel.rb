class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    chatroom = Chatroom.find(params[:id])
    stream_for_chatroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
