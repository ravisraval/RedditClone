class CreateSubs < ActiveRecord::Migration[5.0]
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
