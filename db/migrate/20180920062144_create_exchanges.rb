class CreateExchanges < ActiveRecord::Migration[5.2]
  def change
    create_table :exchanges do |t|
      t.string :exchange_type
      t.belongs_to :account, index: true

      t.timestamps
    end
  end
end
