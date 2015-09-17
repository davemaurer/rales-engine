class Merchant < ActiveRecord::Base

  validates_presence_of :name

  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def total_revenue
    {revenue: invoices.successful.joins(:invoice_items).sum("quantity * unit_price")}
  end

  def favorite_customer
    Customer.find_by(id: invoices.successful.group_by(&:customer_id).sort_by { |_, v| v.count }.reverse.first.first)
  end
end
