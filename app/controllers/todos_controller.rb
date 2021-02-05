class TodosController < ApplicationController
  def index
    @todos = current_user.todo
    render "index"
  end

  def show
    todo = current_user.todo.find_by(id: params[:id])
    render plain: (todo ? todo.to_pleasant_string : "Todo Not Found")
  end

  def create
    new_todo = Todo.create!(
      todo_text: params[:todo_text],
      due_date: params[:due_date],
      user_id: current_user.id,
      completed: false,
    )
    redirect_to todos_path
  end

  def update
    todo = current_user.todo.find_by(id: params[:id])
    if (todo)
      todo.completed = params[:completed]
      todo.save!
    end
    redirect_to todos_path
  end

  def destroy
    todo = current_user.todo.find_by(id: params[:id])
    if (todo)
      todo.destroy
    end
    redirect_to todos_path
  end
end
