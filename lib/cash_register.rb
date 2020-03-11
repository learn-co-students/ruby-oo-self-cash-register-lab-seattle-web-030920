require 'pry'

class CashRegister

    attr_accessor :discount, :total

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @cart = []
        @last_item_price = 0.0
    end

    def total
        @total
    end

    def add_item(name, price, quantity=1)
        counter = quantity
        while counter != 0 do
            @cart << name
            counter -= 1
        end
        @total += (price * quantity)
        @last_item_price = price * quantity
    end

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        else
            @total = @total - (@discount * 10)
            return "After the discount, the total comes to $#{@total}."
        end
    end

    def items
        @cart
    end

    def void_last_transaction
        if @cart == []
            return 0.0
        else
            @cart.pop
            @total -= @last_item_price
        end
    end

end
