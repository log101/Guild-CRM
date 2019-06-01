class AddDescriptionToCompany < ActiveRecord::Migration[5.2]
  def change
		add_column :companies, :description, :text
  end
end
