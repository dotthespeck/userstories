class CreateWorkPhrases < ActiveRecord::Migration
  def change
    create_table :work_phrases do |t|
      t.text :phrase
    end
  end
end

#
#
# t.text :work_verbs
# t.text :songs_phrases
# t.text :launch_phrases
# t.text :verbs
