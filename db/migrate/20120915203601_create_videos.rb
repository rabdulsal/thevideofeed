class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :key
      t.timestamps
    end
  end
end
