require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  def setup
    # Thiết lập @controller
    @controller = AdminsController.new
  end

  test "user is valid" do
    user = Admin.new(first_name: "John", last_name: "Doe",email: "anvu456@gmail.com", phone: "0777841385", password: "anvu523123456")
    assert user.valid?
  end

  test "user is not valid without a name" do
    user = Admin.new(email: "john@example.com")
    assert_not user.valid?
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admins)
  end

  test 'searches for admins by name or email' do
    @admins = Admin.new(first_name: "John", last_name: "Doe",email: "anvu456@gmail.com", phone: "0777841385", password: "anvu523123456")

    if valid_attributes[:search].present?
        @admins = @admins.where("CONCAT(first_name, ' ', last_name) LIKE ? OR email LIKE ?",
                                "%#{params[:search]}%", "%#{params[:search]}%")
    end

    assert_equal @admins, assigns(:admins)
  end

  test 'returns all admins if search parameter is not present' do
    @admins = Admin.new(first_name: "John", last_name: "Doe",email: "anvu456@gmail.com", phone: "0777841385", password: "anvu523123456")

    if valid_attributes[:search].present?
        @admins = @admins.where("CONCAT(first_name, ' ', last_name) LIKE ? OR email LIKE ?",
                                "%#{valid_attributes[:search]}%", "%#{valid_attributes[:search]}%")
    end

    assert_equal @admins, assigns(:admins)
  end
  def valid_attributes
    { email: 'new_admin@example.com', name: 'name' }
  end
end
