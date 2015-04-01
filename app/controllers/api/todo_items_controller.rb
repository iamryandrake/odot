class Api::TodoItemsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :find_todo_list

  def create
    item = @list.todo_items.new(item_params)
    if item.save
      render status: 200, json: {
        message: "Successfully created Todo item.",
        todo_list: @list,
        todo_item: item
      }.to_json
    else
      render status: 422, json: {
        message: "We were unable to create your Todo item at this time.",
        errors: item.errors
      }.to_json
    end
  end

  def update
    item = @list.todo_items.find(params[:id])
    if item.update(item_params)
      render status: 200, json: {
        message: "Successfully update Todo item.",
        todo_list: @list,
        todo_item: item
      }.to_json
    else
      render status: 422, json: {
        message: "We were unable to update your Todo item at this time.",
        errors: item.errors
      }.to_json
    end
  end

  def destroy
    item = @list.todo_items.find(params[:id])
    if item.destroy
      render status: 200, json: {
        message: "Successfully deleted Todo item.",
        todo_list: @list,
        todo_item: item
      }.to_json
    else
      render status: 422, json: {
        message: "Unable to delete your Todo item at this time.",
        todo_list: @list,
        todo_item: item
      }.to_json
    end
  end

    private
    def item_params
      params.require('todo_item').permit(:content)
    end

    def find_todo_list
      @list = TodoList.find(params[:todo_list_id])
    end
end
