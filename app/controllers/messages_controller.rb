class MessagesController < ApplicationController
  skip_after_action :verify_authorized

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    # @chatroom = Chatroom.last
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    @message.save
    ChatroomChannel.broadcast_to(@chatroom, render_to_string(partial: "message", locals: { message: @message }))
    head :ok
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
