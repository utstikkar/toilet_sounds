class AddIsDjToMyUser < ActiveRecord::Migration
  def change
    add_column :users, :is_dj, :boolean
  end
end
