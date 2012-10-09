class AddVimeoToPerson < ActiveRecord::Migration
  def change
    add_column :people, :vimeo_username, :string
  end
end
