require 'csv'

namespace :csv do
  desc 'parse csv files and populate database'

  task :setup => :environment do
    file = File.read('./lib/assets/csv/customers.csv')
    parsed_files = CSV.parse(file, headers: true)
    parsed_files.each do |row|
      Customer.create(row.to_h.except('id'))
    end
  end

  task :setup => :environment do
    file = File.read('./lib/assets/csv/merchants.csv')
    parsed_files = CSV.parse(file, headers: true)
    parsed_files.each do |row|
      Merchant.create(row.to_h.except('id'))
    end
  end

  task :setup => :environment do
    file = File.read('./lib/assets/csv/items.csv')
    parsed_files = CSV.parse(file, headers: true, header_converters: :symbol)
    parsed_files.each do |row|
      Item.create!(id:         row[:id],
                  name:        row[:name],
                  description: row[:description],
                  unit_price:  (row[:unit_price].to_f)/100,
                  merchant_id: row[:merchant_id],
                  created_at:  row[:created_at],
                  updated_at:  row[:updated_at])
    end
  end

  task :setup => :environment do
    file = File.read('./lib/assets/csv/invoices.csv')
    parsed_files = CSV.parse(file, headers: true)
    parsed_files.each do |row|
      Invoice.create(row.to_h.except('id'))
    end
  end

  task :setup => :environment do
    file = File.read('./lib/assets/csv/invoice_items.csv')
    parsed_files = CSV.parse(file, headers: true, header_converters: :symbol)
    parsed_files.each do |row|
      InvoiceItem.create!(id:         row[:id],
                          item_id:    row[:item_id],
                          invoice_id: row[:invoice_id],
                          quantity:   row[:quantity],
                          unit_price: (row[:unit_price].to_f)/100,
                          created_at: row[:created_at],
                          updated_at: row[:updated_at])
    end
  end

  task :setup => :environment do
    file = File.read('./lib/assets/csv/transactions.csv')
    parsed_files = CSV.parse(file, headers: true)
    parsed_files.each do |row|
      Transaction.create(row.to_h.except('id', 'credit_card_expiration_date'))
    end
  end
end
