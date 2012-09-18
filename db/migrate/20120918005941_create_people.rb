class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :username
      t.timestamps
    end

    add_index :people, :username
  end
end
