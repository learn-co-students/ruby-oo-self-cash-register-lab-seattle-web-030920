require 'pry'

class CashRegister
    attr_accessor :total, :discount

    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @item_list = []
        @last_transaction = {quantity: 0, price: 0}
    end

    def add_item(title, price, quantity=1)
        @last_transaction[:quantity] = quantity
        @last_transaction[:price] = price
        @total += quantity * price
        quantity.times {@item_list.push(title)}
    end

    def apply_discount
        if discount == nil
            return "There is no discount to apply."
        end
        @total = @total - @total * discount / 100.00
        "After the discount, the total comes to $#{@total.to_int}."
    end

    def items
        @item_list
    end

    def void_last_transaction
        @total = @total - @last_transaction[:quantity] * @last_transaction[:price]
    end
end
