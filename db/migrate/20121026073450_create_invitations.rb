class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :email
			t.string :confirmation_token
			t.boolean :confirmed
      t.timestamps
    end
  end
end
