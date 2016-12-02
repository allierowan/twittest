require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_path
    assert_response :success
    assert_select 'form'
  end

  test "can create new user" do
    post users_path, params: {
      user:
      {
        full_name: "Legolas",
        user_name: "handsome_elf",
        email: "legodislas@elves.com",
        password: "password",
        password_confirmation: "password"
      }
    }
    assert_equal "Legolas", User.last.full_name
  end

  test "confirmation password must match password to save" do
    post users_path, params: {
      user:
      {
        full_name: "Legolas",
        user_name: "handsome_elf",
        email: "legodislas@elves.com",
        password: "password",
        password_confirmation: "otherpassword"
      }
    }
    refute User.find_by(email:"legodislas@elves.com")
  end
end
