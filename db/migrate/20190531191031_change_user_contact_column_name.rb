class ChangeUserContactColumnName < ActiveRecord::Migration[5.2]
  def change
		rename_column :user_contacts, :company_id, :contact_owner
  end
end
