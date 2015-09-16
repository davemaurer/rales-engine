class Merchant < ActiveRecord::Base

  validates_presence_of :name

  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
end
