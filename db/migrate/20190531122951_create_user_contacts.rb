class CreateUserContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_contacts do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :email

      t.timestamps
    end
    add_index :user_contacts, :email, unique: true
  end
end
