class CashRegister
  
  attr_accessor :discount, :total, :items
  
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @transactions = []
  end
  
  def total
    @total
  end
  
  def add_item(title, price, quantity=1)
    @total += (price * quantity)
    quantity.times {@items.push(title)}
    @transactions.push(price*quantity)
  end    
  
  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else 
      @total = @total * (100 - @discount) / 100
      "After the discount, the total comes to $#{total}."
    end
  end 
  
  def void_last_transaction
    @items = @items.pop
    @total -= @transactions[-1]
    @transactions = @transactions.pop
    @total
  end
    
end
  
