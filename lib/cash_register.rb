class CashRegister

    attr_reader :total, :discount
    attr_writer :total

    def initialize(discount = nil)
        @total = 0.0
        @discount = discount
        @items = []
        @last_price = []
    end

    def add_item(title, price, quantity = 1)
        @items.fill(title, @items.length, quantity)
        @total += price * quantity
        @last_price << price * quantity
    end

    def apply_discount
        if @discount
            @total -= @total * (@discount.to_f / 100.0)
            return "After the discount, the total comes to $#{@total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total -= @last_price[-1]
        @last_price.pop
    end

end
