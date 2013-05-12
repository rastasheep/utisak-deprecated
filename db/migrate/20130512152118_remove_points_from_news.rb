class RemovePointsFromNews < ActiveRecord::Migration
  def up
    remove_column :news, :points
  end

  def down
    add_column :news, :points, :integer
  end
end
