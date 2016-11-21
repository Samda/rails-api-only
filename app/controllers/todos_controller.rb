class TodosController < ApplicationController

  def index
    @todos = Todo.all
    render json: { todos: @todos }
  end

  def show
    render(status: 200, json: Todo.find(params[:id]))
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(permitted_params)
    else
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo
      @todo.destroy
      render json: { notice: "Delete success !" }
    else
      render json: { error: "Errors" }
    end
  end

  def create
    @todo = Todo.new(permitted_params)
    if @todo.save
      render(status: 200, json: Todo.find(@todo))
    else
      render(status: 422, json: {state: 422, todo: @todo.errors.messages})
    end
  end

  private
  
  def permitted_params
    params.require(:todo).permit(:title, :done).to_h
  end
end

#create json format
#{"title" : "title name", "done" : true }
