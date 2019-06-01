require 'test_helper'

class InvitationFuncTest < ActionDispatch::IntegrationTest
	test "can see invitations" do
		post login_url,
			params: { session: { email: users(:one).email, password: "spiral"}}
		follow_redirect!
		assert_match companies(:two).name, @response.body
	end

	test "can accept invitation" do
		delete company_invitation_path(companies(:two).id, users(:one).id)+"/accept"
		assert_response :redirect
		follow_redirect!
		assert_match users(:one).username, @response.body
	end

	test "can reject invitation" do
		delete company_invitation_path(companies(:two).id, users(:one).id)+"/reject"
		assert_response :redirect
		follow_redirect!
		assert_equal Worker.where("user_id = ? AND company_id = ?",
															users(:one).id,
															companies(:two).id).empty?, true	
	end
end
