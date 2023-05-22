require "test_helper"

class PassWordResetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pass_word_resets_new_url
    assert_response :success
  end

  test "should get edit" do
    get pass_word_resets_edit_url
    assert_response :success
  end
end
