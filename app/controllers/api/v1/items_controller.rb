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
    if find_params.keys.include?('unit_price')
      find_params['unit_price'] = (find_params['unit_price'].to_f/100).to_s
      respond_with InvoiceItem.find_by(find_params)
    else
      respond_with Item.find_by(find_params)
    end
  end

  def find_all
    if find_params.keys.include?('unit_price')
      find_params['unit_price'] = (find_params['unit_price'].to_f/100).to_s
      respond_with InvoiceItem.where(find_params)
    else
      respond_with Item.where(find_params)
    end
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
    sanitize = params.permit(:id, :name, :description, :merchant_id, :unit_price, :created_at, :updated_at)
    sanitize['unit_price'] &&= (sanitize['unit_price'].to_f/100).to_s
    sanitize
  end
end
