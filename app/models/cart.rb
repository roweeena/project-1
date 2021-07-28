class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
    has_many :items, through: :line_items
    belongs_to :user, :optional => true

    def total
      sum = 0
          self.line_items.each do |line_item|
            if line_item.item
            sum+= line_item.item.price + line_item.item.shipping
            end
          end
      return sum
    end
end
