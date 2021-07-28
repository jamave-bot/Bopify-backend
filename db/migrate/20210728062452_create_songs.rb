class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :song_link
      t.string :source
      t.belongs_to :playlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
