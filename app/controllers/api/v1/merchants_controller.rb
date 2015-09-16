class Api::V1::MerchantsController < ApplicationController
  def index
    respond_with Merchant.all
  end

  def show
    respond_with merchant
  end

  def random
    respond_with Merchant.all.sample
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

  private

  def merchant
    Merchant.find_by(id: params[:id])
  end

  def find_params
    cap_params = params.permit(:id, :name, :created_at, :updated_at)
    cap_params['name'] &&= params['name']
    cap_params
  end
end
# .split.map(&:capitalize).join(' ').split('-').map(&:titleize).join('-')
