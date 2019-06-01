class ChangeUserContactColumn < ActiveRecord::Migration[5.2]
  def change
		remove_column :user_contacts, :contact_owner_id
		add_reference :user_contacts, :companies
  end
end
