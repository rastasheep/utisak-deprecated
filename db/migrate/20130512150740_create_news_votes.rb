class CreateNewsVotes < ActiveRecord::Migration
  def change
    create_table :news_votes do |t|
      t.integer :news_id
      t.integer :user_id

      t.timestamps
    end
  end
end
