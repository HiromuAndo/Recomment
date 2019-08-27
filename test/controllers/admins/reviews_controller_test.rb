require 'test_helper'

class Admins::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_reviews_index_url
    assert_response :success
  end

  test "should get edit" do
    get admins_reviews_edit_url
    assert_response :success
  end

end
