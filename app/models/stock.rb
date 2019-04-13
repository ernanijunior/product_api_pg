class Stock < ApplicationRecord
    validates :provider, :name, :description, :price, :amount, presence: true
end
