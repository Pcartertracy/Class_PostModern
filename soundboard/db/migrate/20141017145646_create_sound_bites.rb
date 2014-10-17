class CreateSoundBites < ActiveRecord::Migration
  def change
    create_table :sound_bites do |t|
      t.string :title
      t.string :transcript
      t.integer :lengh
      t.binary :audiofile

      t.timestamps
    end
  end
end
