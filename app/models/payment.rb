class Payment < ApplicationRecord
  belongs_to :contract
  belongs_to :milestone, optional: true

  enum status: { pending: 0, succeeded: 1, refunded: 2 }, _default: :pending
end
