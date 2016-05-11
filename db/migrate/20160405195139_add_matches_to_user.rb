class AddMatchesToUser < ActiveRecord::Migration
  def change
    add_column :users, :matches, :string, array:true, default: []
  end
end
