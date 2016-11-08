class ItemsController < ApplicationController
  def index
    @list = List.find(params[:list_id])
    @items = @list.items
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @list = List.find(params[:list_id])
  end

  def create
    @item = List.find(params[:list_id]).items.new(item_params)
    if @item.save
      redirect_to list_items_path
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    if @item.update(item_params)
      redirect_to list_items_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to list_items_path
  end

  private
  # Strong params - allowing specific data to come into the controller. Security.
    def item_params
      params.require(:item).permit(:item, :description,
                                   :completed, :list_id)
    end


end
