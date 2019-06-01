require 'test_helper'

class CompanyFuncTest < ActionDispatch::IntegrationTest
	test "User can add and delete a company" do
		#add
		post login_url,
			params: { session: { email: users(:one).email, 
											 password:"spiral"}}
		post companies_path,
			params: { company: {description: "It is a very special company, feel free
											 to join us!", name: "biscom"}}	
		assert_response :redirect
		assert_redirected_to company_path(Company.last)
		follow_redirect!
		assert_response :success
		
		#delete
		delete company_path(Company.last)
		assert_response :redirect
		assert_redirected_to user_path(users(:one))
		follow_redirect!
		assert_response :success
	end

	test "Can add and delete a worker" do
		post company_workers_path(companies(:one)),
			params: { company: { email: users(:two).email }}
		assert_response :redirect
		follow_redirect!
		assert_match users(:two).username, @response.body

		delete company_worker_path(companies(:one), 
												Worker.find_by(user_id: users(:two).id))
		assert_response :redirect
		follow_redirect!
		assert_no_match users(:two).username, @response.body
	end

	test "Can not add invalid worker" do
		post company_workers_path(companies(:one)),
			params: { company: { email: "invalid_email" }}
		assert_includes "User or Company could not be found !", flash[:alert]
	end
end
