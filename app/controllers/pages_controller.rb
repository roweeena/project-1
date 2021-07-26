class PagesController < ApplicationController
  def home
    @item = Item.all
  end
end
