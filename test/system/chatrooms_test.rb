require "application_system_test_case"

class ChatroomsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/"

    assert_selector "h1", text: "Chatrooms"
    assert_selector ".card-chatroom", count: Chatroom.count
  end

  test "lets a signed in user create a new chatroom" do
    login_as users(:george)
    visit "/chatrooms/new"
    # save_and_open_screenshot

    fill_in "chatroom_name", with: "Books"
    # save_and_open_screenshot

    click_on 'Create Chatroom'
    # save_and_open_screenshot

    # Should be redirected to Home with new product
    assert_equal root_path, page.current_path
    assert_text "Books"
  end
end
