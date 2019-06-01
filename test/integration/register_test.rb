require 'test_helper'

class RegisterTest < ActionDispatch::IntegrationTest
  test "Can see homepage" do
    get root_url
		assert_response :success
	end

	test "Can see register page" do
		get register_url 
		assert_response :success
	end

	test "Can register and redirected to user page"	do
		post users_url,
			params: { user: {username: "furkanus98", email: "furkanus98@mail.com",
										password: "yololoy", password_confirmation: "yololoy"}}
		assert_response :redirect
		follow_redirect!
		assert_select "h1", "Hello furkanus98"
	end

	test "Can not register with the same email" do
	post users_url,
		params: { user: {username: "furkanus98", email: users(:one).email,
										password: "yololoy", password_confirmation: "yololoy"}}
	assert_match "Sorry, registration failed.", @response.body
	end
	
	test "Can not register with the same username" do
	post users_url,
		params: { user: {username: users(:one).username, email: "elin@mail.com",
										password: "yololoy", password_confirmation: "yololoy"}}
	assert_match "Sorry, registration failed.", @response.body
	end

	test "User can delete own account" do
		post login_url,
			params: { session: { email: "frknerdm@mail.com", password: "spiral" }}
		delete user_path(users(:one))
		post login_url,
			params: { session: { email: "frknerdm@mail.com", password: "spiral" }}
		assert_equal "Login Failed!", flash[:alert]
	end
	
	
end
