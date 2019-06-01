require 'test_helper'

class UserFuncTest < ActionDispatch::IntegrationTest
	test "User can see owned companies" do
		post login_url,
			params: { session: { email: users(:one).email, password: "spiral"}}
		follow_redirect!
		assert_match companies(:one).name, @response.body
	end
end
