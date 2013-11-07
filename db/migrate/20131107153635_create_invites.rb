class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.references :user, index: true
      t.references :event, index: true
      t.boolean :status, :default => false 

      t.timestamps
    end
  end
end
