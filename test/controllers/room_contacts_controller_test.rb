require 'test_helper'

class RoomContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get room_contacts_show_url
    assert_response :success
  end

  test "should get new" do
    get room_contacts_new_url
    assert_response :success
  end

end
