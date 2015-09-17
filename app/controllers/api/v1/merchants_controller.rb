class Api::V1::MerchantsController < ApplicationController
  def index
    respond_with Merchant.all
  end

  def show
    respond_with merchant
  end

  def random
    respond_with Merchant.all.limit(1).order('RANDOM()')
  end

  def find
    respond_with Merchant.find_by(find_params)
  end

  def find_all
    respond_with Merchant.where(find_params)
  end

  def items
    respond_with merchant.items
  end

  def invoices
    respond_with merchant.invoices
  end

  def revenue
    respond_with merchant.total_revenue
  end

  def favorite_customer
    respond_with merchant.favorite_customer
  end

  private

  def merchant
    Merchant.find_by(id: params[:id])
  end

  def find_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
