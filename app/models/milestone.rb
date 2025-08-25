class Milestone < ApplicationRecord
  belongs_to :contract
  has_one :payment, dependent: :nullify

  enum status: { pending: 0, submitted: 1, approved: 2, paid: 3 }, _default: :pending
end
