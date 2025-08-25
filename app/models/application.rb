class Application < ApplicationRecord
  belongs_to :job
  belongs_to :freelancer, class_name: "User", inverse_of: :applications

  enum status: { pending: 0, shortlisted: 1, accepted: 2, rejected: 3 }, _default: :pending
end
