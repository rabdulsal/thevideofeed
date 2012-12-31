class AddDailyToSubscribers < ActiveRecord::Migration
  def change
    change_table(:subscribers) do |t|
      t.boolean :daily, default: true, null: false
    end
  end
end
