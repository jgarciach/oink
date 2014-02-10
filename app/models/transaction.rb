class Transaction < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  attr_accessible :amount, :category, :date, :description, :notes, :account_id, :rolling_balance

  belongs_to :account

  after_create :update_balance_with_new_transaction_amount
  around_update :update_balance_with_new_amount
  after_destroy :remove_destroyed_amount_from_balance

  def balance_in(currency)
    number_to_currency(self.rolling_balance, unit: currency)
  end

  def amount_in(currency)
    number_to_currency(self.amount, unit: currency)
  end

  def update_balance_with_new_transaction_amount
    self.update_balance(self.amount)
    self.rolling_balance = self.account.balance
    self.save
  end

  def update_balance_with_new_amount
    amount = self.amount
    yield
    diff = self.amount - amount
    if diff != 0
      self.update_balance(diff)
      self.rolling_balance = self.account.balance
      self.save
    end
  end

  def remove_destroyed_amount_from_balance
    self.update_balance(-self.amount)
  end

  def update_balance(amount)
    if self.try(:account)
      self.account.balance += amount
      self.account.save
    else
      false
    end
  end

end
