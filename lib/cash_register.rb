require 'pry'

class CashRegister
attr_accessor :items, :discount, :total, :last_transaction
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end
    
    def add_item(title, price, quantity=1)
        self.total += price * quantity
        quantity.times do
            items << title
        
        end
        self.last_transaction = price * quantity
    end
    
    #refactored
    def apply_discount
        if discount != 0
            self.total = (total * ((100.0 - discount.to_f)/100)).to_i
            "After the discount, the total comes to $#{self.total}."
        else
        "There is no discount to apply."
        end
    end

    # def apply_discount
    #    if discount != 0
    #    percent = discount.to_f / 100
    #     discount_amount = @total * percent
    #     @total = @total - discount_amount
    #     "After the discount, the total comes to $#{@total.to_i}."
    #    else 
    #     "There is no discount to apply."
    #    end
    # end

    def void_last_transaction
        self.total = self.total - self.last_transaction
    end

    
end

test_register = CashRegister.new
test_register_with_discount = CashRegister.new(50)
#binding.pry