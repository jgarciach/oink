class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.date :balance

      t.timestamps
    end
  end
end
