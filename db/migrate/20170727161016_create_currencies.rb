class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name
      t.decimal :buy
      t.decimal :sell
      t.decimal :variation

      t.timestamps null: false
    end
  end
end
