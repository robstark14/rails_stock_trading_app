class ChangeRoleToString < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :role, :string, default:""
  end
end
