class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @chatroom = Chatroom.find(params[:chatroom_id])
  end
end
