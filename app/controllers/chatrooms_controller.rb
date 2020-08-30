class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chat_params)
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render :new
    end
  end

  def edit
    @chatroom = Chatroom.find(params[:id])
  end

  def update
    @chatroom = Chatroom.find(params[:id])
    if @chatroom.update
      redirect_to chatroom_path(@chatroom)
    else
      render :edit
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def chat_params
    params.require(:chatroom).permit(:name)
  end
end
