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
    todo = Todo.new(
      todo_text: params[:todo_text],
      due_date: params[:due_date],
      user_id: current_user.id,
      completed: false,
    )
    # Run validations
    if (!todo.save)
      flash[:error] = todo.errors.full_messages
    else
        flash[:info] = Array("Todo created")
    end
    redirect_to todos_path
  end

  def update
    todo = current_user.todo.find_by(id: params[:id])
    if (todo)
      todo.completed = params[:completed]
      todo.save!
      flash[:info] = (todo.completed ? Array("Todo marked as complete") : Array("Todo marked as incomplete"))
    end
    redirect_to todos_path
  end

  def destroy
    todo = current_user.todo.find_by(id: params[:id])
    if (todo)
      todo.destroy
      flash[:info] = Array("Todo deleted")
    end
    redirect_to todos_path
  end
end
