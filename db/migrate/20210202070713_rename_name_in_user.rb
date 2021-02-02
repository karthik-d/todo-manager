class RenameNameInUser < ActiveRecord::Migration[6.1]
  def change
      rename_column(:users, :name, :firstname)
  end
end
