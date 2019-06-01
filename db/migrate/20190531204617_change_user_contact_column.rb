class ChangeUserContactColumn < ActiveRecord::Migration[5.2]
  def change	
		add_reference :user_contacts, :companies
  end
end
