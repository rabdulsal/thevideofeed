class AddSourceToVideo < ActiveRecord::Migration
  def up
    add_column :videos, :source, :string
    Video.all.each do |video|
       video.update_attributes! source: "youtube"
    end
  end
  def down
    remove_column :videos, :source
  end

end
