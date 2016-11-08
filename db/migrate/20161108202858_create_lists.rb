class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :title
      t.boolean :completed

      t.timestamps
    end
  end
end
