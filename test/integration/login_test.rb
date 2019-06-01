require 'test_helper'
class LoginTest < ActionDispatch::IntegrationTest
	test "User can see login page" do
		get login_url
		assert_response :success
	end

	test "User can log in" do
		post login_url,
			params: { session: { email: users(:one).email, password: "spiral"}}
		assert_response :redirect
		follow_redirect!
		assert_response :success
		assert_select "h1", "Hello Furkan"
	end

	test "User cant see another user profile" do
		post login_url,
			params: { session: { email: users(:one).email, 
											 password: 'spiral'}}
		get user_path(users(:two))
		assert_response :redirect
		assert_equal 'You are not allowed to see this page !', flash[:alert]
	end	
end
