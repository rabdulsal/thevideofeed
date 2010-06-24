class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string :canonical_url
      t.string :type
      t.string :version
      t.string :title
      t.string :author_name
      t.string :author_url
      t.string :provider_name
      t.string :provider_url
      t.integer :cache_age
      t.string :thumbnail_url
      t.integer :thumbnail_width
      t.integer :thumbnail_height
      t.text :description
      t.integer :height
      t.integer :width
      t.text :html
      t.timestamps
    end

    add_index :videos, :canonical_url, :unique => true
  end

  def self.down
    drop_table :videos
  end
end
