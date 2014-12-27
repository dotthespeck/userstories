class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.integer :ip_adress, null: false
      t.integer :story_id, null: false
    end
  end
end
