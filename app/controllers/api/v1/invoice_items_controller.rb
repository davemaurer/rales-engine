class Api::V1::InvoiceItemsController < ApplicationController
  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with invoice_item
  end

  def random
    respond_with InvoiceItem.limit(1).order('RANDOM()')
  end

  def find
    respond_with InvoiceItem.find_by(find_params)
  end

  def find_all
    respond_with InvoiceItem.where(find_params)
  end

  def invoice
    respond_with invoice_item.invoice
  end

  def item
    respond_with invoice_item.item
  end

  private

  def invoice_item
    InvoiceItem.find_by(id: params[:id])
  end

  def find_params
    params.permit(:id, :item_id, :invoice_id, :unit_price, :quantity, :created_at, :updated_at)
  end
end
