require 'rails_helper'

RSpec.describe ChatroomsController, type: :controller do
  describe "GET index" do
    it "assigns @chatrooms" do
      chatroom = Chatroom.create
      get :index
      expect(assigns(:chatrooms)).to eq([chatroom])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end

