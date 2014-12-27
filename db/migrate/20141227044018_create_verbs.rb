class CreateVerbs < ActiveRecord::Migration
  def change
    create_table :verbs do |t|
      t.text :verb, null: false
    end
  end
end
