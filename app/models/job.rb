class Job < ApplicationRecord
  belongs_to :client, class_name: "User", inverse_of: :jobs
  has_and_belongs_to_many :skills

  enum status: { open: 0, in_progress: 1, closed: 2 }, _default: :open
end
