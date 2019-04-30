class Account < ApplicationRecord
    has_secure_password
    has_many :households

    validates :account_name,
        presence: true,
        format: { with: /\A[a-zA-Z0-9]+\z/ },
        uniqueness: true,
        allow_nil: true

    validates :display_name,
        presence: true,
        allow_nil: true

    validates :password,
        presence: true,
        format: { with: /\A[a-zA-Z0-9]+\z/ },
        length: { minimum: 4 },
        allow_nil: true

end