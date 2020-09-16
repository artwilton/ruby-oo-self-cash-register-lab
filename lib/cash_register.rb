class CashRegister

    attr_accessor :discount, :total

    def initialize(discount = 0, total = 0 )
        @total = total
        @discount = discount
    end

    def add_item(title, price, quantity = 1)

        if @title_price_quant_AoH.kind_of?(Array)
            @title_price_quant_AoH.push(:title => title, :price => price, :quantity => quantity)
        else
            @title_price_quant_AoH = []
            @title_price_quant_AoH.push(:title => title, :price => price, :quantity => quantity)
        end

        self.total += (price * quantity)

    end

    def apply_discount
        if self.discount == 0
            p "There is no discount to apply."
        else
            self.total -= (self.total.to_f * discount.to_f/100.0)
            p "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def items
        @title_price_quant_AoH.map {|i| i = Array.new(i[:quantity], i[:title])}.flatten
    end
    
    def void_last_transaction
        last_transaction_price = @title_price_quant_AoH[-1][:price]
        last_transaction_quantity = @title_price_quant_AoH[-1][:quantity]
        self.total -= (last_transaction_price * last_transaction_quantity)
    end

end