class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :stock_symbol
      t.string :transaction_type
      t.decimal :buying_price
      t.decimal :order_quantity
      t.decimal :amount

      t.timestamps
    end
  end
end
