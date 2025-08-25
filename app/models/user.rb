class User < ApplicationRecord
    enum role: { admin: 0, client: 1, freelancer: 2 }, _default: :freelancer

    # has_one  :profile, dependent: :destroy
    # has_many :jobs, foreign_key: :client_id, inverse_of: :client, dependent: :nullify
    # has_many :applications, foreign_key: :freelancer_id, inverse_of: :freelancer, dependent: :destroy
    # has_many :contracts_as_client, class_name: "Contract", foreign_key: :client_id, dependent: :nullify
    # has_many :contracts_as_freelancer, class_name: "Contract", foreign_key: :freelancer_id, dependent: :nullify
    # has_many :messages, dependent: :destroy
end
