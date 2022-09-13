class Portfolio < ApplicationRecord
    belongs_to :user
    validates :quantity, numericality: {greater_than_or_equal_to: 0, message: " to be sold must not exceed owned quantity"}
    include IexAccessor

    def total_value
        self.access_quote.latest_price * self.quantity
    end

    def delete_zero_quantity_stock
        if self.quantity == 0
            self.destroy
        end
    end
end
