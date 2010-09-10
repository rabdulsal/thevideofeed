class EmbedlyP2 < ActiveRecord::Migration
  def self.up
    rename_column :videos, :embedly, :embedly_attrs
  end

  def self.down
  end
end
