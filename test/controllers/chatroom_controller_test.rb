require 'test_helper'

class ChatroomControllerTest < ActionDispatch::IntegrationTest
  # called before every single test
  setup do
    @chatroom = chatrooms(:one)
  end

  # called after every single test
  teardown do
    # when controller is using cache it may be a good idea to reset it afterwards
    Rails.cache.clear
  end

  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should get show" do
    # Reuse the @chatroom instance variable from setup
    get chatroom_url(@chatroom)
    assert_response :success
    assert @chatroom.valid?, "'#{@chatroom.inspect}' should be valid"
  end

  test "should create chatroom" do
    assert_difference('Chatroom.count') do
      post chatroom_url, params: { chatroom: { name: 'Some Name' } }
    end

    assert_redirected_to chatroom_path(Chatroom.last)
    assert_equal 'Chatroom was successfully created.', flash[:notice]
  end

  test "should update article" do

    patch chatroom_url(@chatroom), params: { chatroom: { name: "updated" } }

    assert_redirected_to chatroom_path(chatroom)
    # Reload association to fetch updated data and assert that name is updated.
    chatroom.reload
    assert_equal "updated", chatroom.name
  end

  test "should destroy article" do
    assert_difference('Chatroom.count', -1) do
      delete chatroom_url(@chatroom)
    end

    assert_redirected_to chatrooms_path
  end
end
