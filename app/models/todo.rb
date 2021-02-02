class Todo < ActiveRecord::Base
    belongs_to :user

    def to_pleasant_string
        checkbox = completed ? "[X]" : "[ ]"
        "#{id}. #{due_date.to_s(:long)}   #{todo_text.ljust(16)} #{checkbox}"
    end

    def self.overdue
      all.where("due_date < ?", Date.today)
    end

    def self.due_today
      all.where("due_date = ?", Date.today)
    end

    def self.due_later
      all.where("due_date > ?", Date.today)
    end

    def self.completed
        all.where(completed: true)
    end

    def self.not_completed
        all.where(completed: false)
    end

end
