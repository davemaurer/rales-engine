class Customer < ActiveRecord::Base

  validates_presence_of :first_name, :last_name

  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices

  def favorite_merchant
    Merchant.find_by(id: invoices.successful.group(:merchant_id).order('count_id DESC').limit(1).count(:id).keys)
  end
end
