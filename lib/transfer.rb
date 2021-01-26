require 'pry'
class Transfer
  
  attr_accessor :status, :sender, :receiver, :amount
  def initialize(sen,rec,amount)
    self.sender = sen
    self.receiver = rec
    self.amount = amount
    self.status = "pending"
  end

  def valid?
    self.sender.valid? && self.sender.balance - amount > 0 && self.receiver.valid?
  end

  def execute_transaction
    # binding.pry
    if self.valid? && self.status == "pending" 
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end

  end
end
