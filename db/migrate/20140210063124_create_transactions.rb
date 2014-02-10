class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :date
      t.string :description
      t.string :category
      t.decimal :amount
      t.string :notes

      t.timestamps
    end
  end
end
