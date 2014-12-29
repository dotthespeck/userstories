class CreateWorkVerbs < ActiveRecord::Migration
  def change
    create_table :work_verbs do |t|
      t.string :verb, null: false
    end
  end
end
