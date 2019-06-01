class AddCompanyToTags < ActiveRecord::Migration[5.2]
  def change
		change_table :tags do |t|
			t.references :company, foreign_key: true
		end
 		change_table :users do |t|
			t.references :owned_companies
			t.references :working_companies
		end
	end
end
