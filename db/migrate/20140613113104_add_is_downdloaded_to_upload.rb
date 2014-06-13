class AddIsDowndloadedToUpload < ActiveRecord::Migration
  def change
    add_column :uploads, :is_downloaded, :boolean
  end
end
