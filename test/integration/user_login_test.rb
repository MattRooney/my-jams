require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest

  test 'a registered user can login' do
    login_user

    assert page.has_content?("Welcome, Matt!")
    assert page.has_content?("Logout")
  end

  test 'unregistered guest cannot loging' do
    visit login_path
    fill_in "Username", with: "Matt"
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Invalid Login")
  end

  test "existing user cannot login with wrong password" do
    user = User.create(username: "Matt",
                       password: "password")

    visit login_path
    fill_in "Username", with: "Matt"
    fill_in "Password", with: "assword"
    click_button "Login"

    assert page.has_content?("Invalid Login")
  end

  test "existing user cannot login with wrong username" do
    user = User.create(username: "Matt",
                       password: "password")

    visit login_path
    fill_in "Username", with: "Fatt"
    fill_in "Password", with: "assword"
    click_button "Login"

    assert page.has_content?("Invalid Login")
  end

  test "authenticated user can logout" do
    login_user

    assert page.has_content?("Welcome, Matt!")

    click_link "Logout"

    assert page.has_content?("Bye bye!")
  end

  def login_user
    user = User.create(username: "Matt",
                       password: "password")

    visit login_path
    fill_in "Username", with: "Matt"
    fill_in "Password", with: "password"
    click_button "Login"
  end

end
