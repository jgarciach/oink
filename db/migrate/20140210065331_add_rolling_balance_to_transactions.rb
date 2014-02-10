class AddRollingBalanceToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :rolling_balance, :decimal
  end
end
