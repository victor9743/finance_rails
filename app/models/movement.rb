class Movement < ApplicationRecord
  belongs_to :user
  enum movement_type: { entrance: 1, exit: 2 }
end
