class RemoveCanonicalUrl < ActiveRecord::Migration
  def self.up
    remove_column :videos, :canonical_url
  end

  def self.down
    add_column :videos, :canonical_url, :string
  end
end
