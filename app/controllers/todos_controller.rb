class TodosController < ApplicationController
  def index
    render(status: 200, json: Todo.all)
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
    @todo = Todo.new(params[:id])
    if @todo.destroy(@todo)
      render(status: 200, json: { notice: "Delete success !" })
    else
      render(status: 200, json: { error: "Errors" })
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
