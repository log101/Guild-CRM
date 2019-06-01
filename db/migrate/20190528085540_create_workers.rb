class CreateWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :workers do |t|
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.timestamps
    end
		
		remove_column :companies, :workers_id, :integer


  end
end
