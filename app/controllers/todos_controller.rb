class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    #render plain: Todo.order(:due_date).
    #         map(&:to_pleasant_string).
    #         join("\n")
    render "index"
  end

  def show
    todo = Todo.find_by(id: params[:id])
    render plain: (todo ? todo.to_pleasant_string : "Todo Not Found")
  end

  def create
    new_todo = Todo.create!(
      todo_text: params[:todo_text],
      due_date: params[:due_date],
      completed: false,
    )
    response_text = "New todo created with ID:#{new_todo.id}"
    render plain: response_text
  end

  def update
    modify_todo = Todo.find_by(id: params[:id])
    if (modify_todo)
      completed = params[:completed]
      modify_todo.completed = completed
      modify_todo.save!
      response_text = "Todo marked as #{completed.downcase == "true" ? "complete" : "pending"}"
    else
      response_text = "Todo Not Found"
    end
    render plain: response_text
  end
end
