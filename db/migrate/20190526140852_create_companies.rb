class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
			t.references :owner
			t.references :workers
			t.references :tag, foreign_key: true
		 	t.timestamps
    end
  end
end
