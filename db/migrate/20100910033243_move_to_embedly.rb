class MoveToEmbedly < ActiveRecord::Migration
  def self.up
    remove_column :videos, :version
    remove_column :videos, :title
    remove_column :videos, :author_name
    remove_column :videos, :author_url
    remove_column :videos, :provider_name
    remove_column :videos, :provider_url
    remove_column :videos, :cache_age
    remove_column :videos, :thumbnail_url
    remove_column :videos, :thumbnail_width
    remove_column :videos, :thumbnail_height
    remove_column :videos, :description
    remove_column :videos, :height
    remove_column :videos, :width
    remove_column :videos, :html
    remove_column :videos, :created_at
    remove_column :videos, :updated_at
    remove_column :videos, :url
    remove_column :videos, :posts_count

    add_column :videos, :url, :string
    add_column :videos, :created_at, :datetime
    add_column :videos, :embedly, :text
    add_column :videos, :posts_count, :integer, :default => 0
  end

  def self.down
  end
end
