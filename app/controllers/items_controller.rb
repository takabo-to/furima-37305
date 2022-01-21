class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @items = Item.new
  end


  private

  def item_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
