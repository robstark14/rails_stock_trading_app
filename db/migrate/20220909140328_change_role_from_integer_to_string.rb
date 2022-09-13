class ChangeRoleFromIntegerToString < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :role, :string, default:"for_approval"
  end
end
