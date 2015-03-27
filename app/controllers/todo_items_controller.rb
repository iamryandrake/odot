class TodoItemsController < ApplicationController
  def index
    @todo_list = TodoList.where(params[:todo_list_id])
  end
end
