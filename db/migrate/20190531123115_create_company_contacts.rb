class CreateCompanyContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :company_contacts do |t|
      t.references :company, foreign_key: true
      t.string :name
      t.string :website

      t.timestamps
    end
  end
end
