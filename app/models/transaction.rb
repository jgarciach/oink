class Transaction < ActiveRecord::Base
  attr_accessible :amount, :category, :date, :description, :notes
end
