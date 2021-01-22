class Todo < ActiveRecord::Base
    def to_pleasant_string
        checkbox = completed ? "[X]" : "[ ]"
        "#{id}. #{due_date.to_s(:long)}   #{todo_text.ljust(16)} #{checkbox}"
    end
end
