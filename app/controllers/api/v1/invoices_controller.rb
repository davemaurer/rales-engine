class Api::V1::InvoicesController < ApplicationController
  def index
    respond_with Invoice.all
  end

  def show
    respond_with invoice
  end

  def random
    respond_with Invoice.all.sample
  end

  def find
    respond_with Invoice.find_by(find_params)
  end

  def find_all
    respond_with Invoice.where(find_params)
  end

  def transactions
    respond_with invoice.transactions
  end

  def items
    respond_with invoice.items
  end

  def customer
    respond_with invoice.customer
  end

  def merchant
    respond_with invoice.merchant
  end

  def invoice_items
    respond_with invoice.invoice_items
  end

  private

  def invoice
    Invoice.find_by(id: params[:id])
  end

  def find_params
    params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
  end
end
