class AddDirectorField < ActiveRecord::Migration
  def change
    add_column :movies, :director, :string
  end

  def down
  end
end
