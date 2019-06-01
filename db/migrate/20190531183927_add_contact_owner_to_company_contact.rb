class AddContactOwnerToCompanyContact < ActiveRecord::Migration[5.2]
  def change
		add_column :company_contacts, :contact_owner, :string
		add_reference :user_contacts, :company, foreign_key: true
  end
end
