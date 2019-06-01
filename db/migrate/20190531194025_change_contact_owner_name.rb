class ChangeContactOwnerName < ActiveRecord::Migration[5.2]
  def change
		rename_column :company_contacts, :contact_owner, :contact_owner_id
  end
end
