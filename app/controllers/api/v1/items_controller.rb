class Api::V1::ItemsController < ApplicationController
  def index
    respond_with Item.all
  end

  def show
    respond_with item
  end

  def random
    respond_with Item.all.sample
  end

  def find
    respond_with Item.find_by(find_params)
  end

  def find_all
    respond_with Item.where(find_params)
  end

  def invoice_items
    respond_with item.invoice_items
  end

  def merchant
    respond_with item.merchant
  end

  private

  def item
    Item.find_by(id: params[:id])
  end

  def find_params
    params.permit(:id, :name, :description, :merchant_id, :unit_price, :created_at, :updated_at)
  end
end
