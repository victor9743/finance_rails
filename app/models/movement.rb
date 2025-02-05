class Movement < ApplicationRecord
  belongs_to :user
  enum :status { entrance: 1, exit: 2 }
end
