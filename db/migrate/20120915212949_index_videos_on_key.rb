class IndexVideosOnKey < ActiveRecord::Migration
  def change
    add_index :videos, :key
  end
end
