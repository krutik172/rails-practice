class Item < ApplicationRecord

    default_scope -> {
        where(is_active: true)
    }
    enum :status, { "In Stock": 0, "Out of Stock": 1, "Coming Soon": 2 }

    has_many :orders, dependent: :destroy

    
end
