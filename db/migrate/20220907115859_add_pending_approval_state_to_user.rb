class AddPendingApprovalStateToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :state, :string, null: false, default: 'Pending'
  end
end
