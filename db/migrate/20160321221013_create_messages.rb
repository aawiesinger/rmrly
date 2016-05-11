class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :to_user
      t.string :from_user
      t.text :body

      t.timestamps null: false
    end
  end
end
