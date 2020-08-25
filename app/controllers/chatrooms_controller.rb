class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = @chatroom.message
  end

  def messsage_params
    params.require(:message).permit(:content)
  end
end
