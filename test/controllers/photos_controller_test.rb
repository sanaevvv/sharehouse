require 'test_helper'

class PhotosControllerTest < ActionDispatch::IntegrationTest
  test "should get references:room" do
    get photos_references:room_url
    assert_response :success
  end

  test "should get titlle:string" do
    get photos_titlle:string_url
    assert_response :success
  end

  test "should get body:text" do
    get photos_body:text_url
    assert_response :success
  end

end
