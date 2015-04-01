class Api::TodoListsController < Api::ApiController

  def index
    render json: TodoList.all
  end

  def show
    list = TodoList.find(params[:id])
    render json: list.as_json(include:[:todo_items])
  end

  def create
    list = TodoList.new(list_params)
    if list.save
      render status: 200, json:  {
        message: "Successfully created Todo list.",
        todo_list: list
      }.to_json
    else
      render status: 422, json:  {
        errors: list.errors
      }.to_json
    end
  end

  def update
    list = TodoList.find(params[:id])
    if list.update(list_params)
      render status: 200, json: {
        message: "Successfully updated Todo list.",
        todo_list: list
      }.to_json
    else
      render status: 422, json: {
        message: "Couldn't update Todo list.",
        todo_list: list
      }.to_json
    end
  end

  def destroy
    list  = TodoList.find(params[:id])
    if list.destroy
      render status: 200, json: {
        message: "Successfully deleted Todo list.",
        todo_list: list
      }.to_json
    else
      render status: 422, json: {
        message: "Unable to delete your Todo list at this time.",
        todo_list: list
      }.to_json
    end
  end

  private
  def list_params
    params.require('todo_list').permit(:title, :description)
  end
end
