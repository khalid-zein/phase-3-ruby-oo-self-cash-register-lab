require "pry"

class CashRegister

    attr_accessor :total, :discount, :items_array, :last_transaction_item, :last_transaction_price

    def initialize(discount = 0)
        @total = 0.00
        @items_array = []
        @last_transaction_item = ''
        @last_transaction_price = 0
        @discount = discount
    end

    def add_item(title, price, quantity = 1)
        self.total += quantity * price
        quantity.times do
            self.items_array.append(title)
        end
        self.last_transaction_item = title
        self.last_transaction_price = quantity * price
    end

    def apply_discount
        float_discount = self.discount.to_f
        if float_discount != 0
            self.total -= float_discount / 100 * self.total 
            "After the discount, the total comes to $#{self.total.to_i}."
        elsif float_discount == 0
            "There is no discount to apply."
        end
    end

    def items
        self.items_array
    end

    def void_last_transaction
        self.items_array.pop
        self.total -= self.last_transaction_price
    end

end

x = CashRegister.new
x.add_item('eggs', 5.00)
x.add_item('milk', 3.00)
x.apply_discount
x.void_last_transaction
