class ChangeContactOwnerType < ActiveRecord::Migration[5.2]
  def change
		change_column :company_contacts, :contact_owner, 
			'integer USING CAST(contact_owner AS integer)'
  end
end
