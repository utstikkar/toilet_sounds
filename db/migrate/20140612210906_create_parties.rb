class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :venue
      t.integer :code
      t.string :name

      t.timestamps
    end
  end
end
