class AddSurveyAnswersToUsers < ActiveRecord::Migration
  def change
    add_column :users, :go_to_bed, :string, :default => ''
    add_column :users, :wake_up, :string, :default => ''
    add_column :users, :smoke, :boolean, :default => false
    add_column :users, :drink, :boolean, :default => false
    add_column :users, :party, :boolean, :default => false 
    add_column :users, :loud_music, :boolean, :default => false
    add_column :users, :messy_or_clean, :string, :default => ''
  end
end
