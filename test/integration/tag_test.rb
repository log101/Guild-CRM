require 'test_helper'

class TagFuncTest < ActionDispatch::IntegrationTest
	test "(user) Add and delete a tag" do
		post login_url,
		params: { session: { email: users(:one).email, 
											 password: "spiral"}}
		
		post user_tags_url(users(:one)),
			params: { tag: {body: "It is a new tag !" }}
		follow_redirect!		
		assert_select "li", /\AIt is a new tag !/ 

		delete user_tag_url(users(:one), Tag.all.last.id)
		assert_response :redirect
		follow_redirect!
		assert_select "li", {:count => 0, :text=>/\AIt is a new tag !\z/}	
	end

	test "(company) Add and delete a tag" do
		post login_url,
		params: { session: { email: users(:one).email, 
											 password: "spiral"}}
		post company_tags_url(companies(:one)),
			params: { tag: {body: "It is a new tag !" }}
		follow_redirect!
		assert_select "li", /\AIt is a new tag !/ 
		delete company_tag_url(companies(:one), Tag.all.last.id)
		assert_response :redirect
		follow_redirect!
		assert_select "li", {:count => 0, :text=>/\AIt is a new tag !\z/} 
	end

	test "Show if tag could not be saved" do
		post login_url,
		params: { session: { email: users(:one).email, 
											 password: "spiral"}}		
		post user_tags_url(users(:one)),
			params: { tag: {body: "x" }}
		assert_select "li", {:count => 0, :text=>"x"}  
	end
end
