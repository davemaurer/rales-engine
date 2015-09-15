class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :credit_card_number
      t.string :result
      t.references :invoice, index: true, foreign_key: true
      t.timestamp :created_at
      t.timestamp :updated_at

    end
  end
end
