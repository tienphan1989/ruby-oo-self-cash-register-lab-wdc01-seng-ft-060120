class CashRegister
    attr_accessor :total, :title, :items, :discount

    def initialize(discount = 0)
        @total = 0
        @items_cost = []
        @items = []
        @discount = discount
    end

    def total
        @total
    end

    def add_item(title, price, quantity = 1)
        @total = @total + (price * quantity)
        quantity.times { @items.push(title) }
        quantity.times { @items_cost.push(price * quantity) }
    end

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        else 
           @total -= @total * (@discount * 0.01)  
            return "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total = @total - @items_cost[-1]
        if @items.count == 0
            @total = 0.0
        end
    end

end
