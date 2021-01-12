class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :count
  def initialize?(sender, reciever, amount)
    @sender = sender
    @reciever = reciever
    @status = "pending"
end
def both_valid?
  if sender.valid? && reciever.valid?
    true
  else
    false
  end
end
def execute_transaction
  if @sender.balance < @amount
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."

  elsif @status == "complete"
    puts "Transaction was already excuted."
  else
    @sender.deposit(@amount * -1)
    @reciever.deposit(@amount)
    @status = "complete"
  end
end
def reverse_transfer
  if @status == "complete"
    @status.deposit(@amount)
    @reciever.deposit(@amount * -1)
    @status = "reversed"
  end
end
end     
