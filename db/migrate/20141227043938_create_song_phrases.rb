class CreateSongPhrases < ActiveRecord::Migration
  def change
    create_table :song_phrases do |t|
      t.text :phrase
    end
  end
end
