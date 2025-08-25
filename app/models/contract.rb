class Contract < ApplicationRecord
  belongs_to :job
  belongs_to :client, class_name: "User"
  belongs_to :freelancer, class_name: "User"

  has_many :milestones, dependent: :destroy
  has_many :payments, dependent: :nullify

  enum status: { active: 0, completed: 1, disputed: 2, cancelled: 3 }, _default: :active
end
