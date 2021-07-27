class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
    has_many :items, through: :line_items
    belongs_to :user

    def total
    sum = 0
    self.line_items.each do |line_item|
      sum+= line_item.item.price
      end
      sum
    end
end
