class CreateLaunchPhrases < ActiveRecord::Migration
  def change
    create_table :launch_phrases do |t|
      t.text :phrase, null: false
    end
  end
end
