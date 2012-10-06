class AddFirstPersonIdToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :first_person_id, :integer
  end
end
