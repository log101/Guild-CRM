class RemoveOwnedCompaniesIdFromUsers < ActiveRecord::Migration[5.2]
  def change
		remove_column :users, :owned_companies_id, :integer
  end
end
