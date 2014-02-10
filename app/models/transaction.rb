class Transaction < ActiveRecord::Base
  attr_accessible :amount, :category, :date, :description, :notes, :account_id, :rolling_balance
  belongs_to :account
end
