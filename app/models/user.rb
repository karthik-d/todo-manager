class User < ApplicationRecord
    def to_pleasant_string
        "#{id}. #{name.ljust(10)} #{email.ljust(20)}"
    end
end
