class Account < ActiveRecord::Base
  attr_accessible :balance
  has_many :transactions
end
