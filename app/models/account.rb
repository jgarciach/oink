class Account < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  attr_accessible :balance

  has_many :transactions

  def balance_in(currency)
    number_to_currency(self.balance, unit: currency)
  end

end
