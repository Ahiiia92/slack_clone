require 'test_helper'

class ChatroomTest < ActiveSupport::TestCase
  test "show returns a specific chatroom" do
    chatroom = Chatroom.new(name: "general")
    assert_equal "general", chatroom.name
  end
end
