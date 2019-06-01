class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.integer :sender_id
      t.integer :invited_id
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
