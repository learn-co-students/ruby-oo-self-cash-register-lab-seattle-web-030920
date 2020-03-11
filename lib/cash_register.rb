
class CashRegister
    attr_accessor :total, :discount, :itemsAdded
    
    def initialize(discount=0)
        @total = 0.to_f
        @discount = discount
        @itemsAdded = []
    end

    def add_item(title,price,quantitiy=1.to_f)                    
        subprice = price.to_f * quantitiy.to_f        
        @total= @total + subprice    
        quantitiy.to_i.times{
            @itemsAdded.push({title: title, price: price, quantitiy: quantitiy})  
    }  
    end

    def apply_discount
        if(@discount > 0.0)
            @total = @total - @total * (@discount.to_f / 100.to_f)
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @itemsAdded.map{|key,value| key[:title]}
    end

    def deduct_from_total(deduct)
        @total = @total - deduct
    end

    def void_last_transaction     
        peekItem = @itemsAdded[0]        
        value = peekItem[:quantitiy].to_i
        puts value.class
        value.times do
            last_item = @itemsAdded.pop
            self.deduct_from_total(last_item[:price].to_f)            
        end
    end 
end
