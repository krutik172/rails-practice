class Car < ApplicationRecord

    enum :fuel_type, { "Petrol": 0, "Diesel": 1, "CNG": 3, "EV": 4 }
end
