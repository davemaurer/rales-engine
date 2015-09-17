class Item < ActiveRecord::Base
  validates_presence_of :name, :description, :merchant_id

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
end
