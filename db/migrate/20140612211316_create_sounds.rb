class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
      t.string :name
      t.string :mood
      t.integer :user_id
      t.string :file_path

      t.timestamps
    end
  end
end
