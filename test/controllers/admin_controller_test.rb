require 'test_helper'

class AdminControllerTest < ActionController::TestCase

  test "user is valid" do
    user = Admin.new(first_name: "John", last_name: "Doe",email: "anvu456@gmail.com", phone: "0777841385", password: "anvu523123456")
    assert user.valid?
  end

  test "user is not valid without a name" do
    user = Admin.new(email: "john@example.com")
    assert_not user.valid?
  end
end
