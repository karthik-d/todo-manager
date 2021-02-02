class ModifyDataTypes < ActiveRecord::Migration[6.1]
  def change
      change_column(:users, :firstname, :string)
      change_column(:users, :lastname, :string)
      change_column(:users, :email, :string)
      change_column(:users, :password_digest, :string)
  end
end
