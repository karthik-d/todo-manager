class TodosController < ApplicationController
  def index
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
    redirect_to todos_path
  end

  def update
    todo = Todo.find_by(id: params[:id])
    if (todo)
      todo.completed = params[:completed]
      todo.save!
    end
    redirect_to todos_path
  end

  def destroy
      todo = Todo.find_by(id: params[:id])
      if (todo)
        todo.destroy
      end
      redirect_to todos_path
  end
end
