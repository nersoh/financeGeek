class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.decimal :dollar
      t.decimal :euro
      t.decimal :bitcoin

      t.timestamps null: false
    end
  end
end
