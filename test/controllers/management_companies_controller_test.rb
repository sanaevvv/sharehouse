require 'test_helper'

class ManagementCompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get management_companies_index_url
    assert_response :success
  end

  test "should get show" do
    get management_companies_show_url
    assert_response :success
  end

  test "should get new" do
    get management_companies_new_url
    assert_response :success
  end

  test "should get edit" do
    get management_companies_edit_url
    assert_response :success
  end

end
