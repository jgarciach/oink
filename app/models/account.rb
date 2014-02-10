class Account < ActiveRecord::Base
  attr_accessible :balance

  has_many :transactions

  include ActionView::Helpers::NumberHelper

  def balance_in(currency)
    if currency
      number_to_currency(self.balance, unit: currency)
    else
      read_attribute(:balance)
    end
  end

end
