require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest

  test 'a registered user can login' do
    user = User.create(username: "Matt", password: "password")

    visit login_path
    fill_in "Username", with: "Matt"
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Welcome, Matt!")
    assert page.has_content?("Logout")
  end
end
