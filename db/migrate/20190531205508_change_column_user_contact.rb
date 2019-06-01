class ChangeColumnUserContact < ActiveRecord::Migration[5.2]
  def change
		#remove_column :user_contacts, :companies_id
		add_reference :user_contacts, :company
  end
end
