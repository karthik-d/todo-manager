class User < ApplicationRecord
    has_secure_password(:password)
    has_many :todo
    validates :firstname, presence: true
    validates :email, presence: true

    def to_pleasant_string
        "#{id}. #{firstname.ljust(10)} #{email}"
    end
end
