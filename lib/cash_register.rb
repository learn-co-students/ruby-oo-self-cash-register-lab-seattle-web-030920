require 'pry'

class CashRegister

  attr_accessor :total, :Last_transaction, :items 
  attr_reader :discount

  def initialize (discount=0)
    @total = 0
    @discount = discount
    @items = []
  end
  

  def add_item (title, price, quantity=1)
    self.total += price * quantity
    
    quantity.times do
      items << title
    end 
    
    self.Last_transaction = price * quantity
  end
  
  
  def apply_discount
    if discount != 0
      self.total = (total * ((100-discount.to_f)/100)).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end 


  def void_last_transaction
    self.total -= self.Last_transaction
  end 
  

end
