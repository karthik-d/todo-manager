class User < ApplicationRecord
    has_many :todo

    def to_pleasant_string
        "#{id}. #{name.ljust(10)} #{email.ljust(20)}"
    end
end
