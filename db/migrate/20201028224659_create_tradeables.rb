class CreateTradeables < ActiveRecord::Migration[5.2]
  def change
    create_table :tradeables do |t|
      t.integer :book_id
      t.integer :user_id
      t.string :status, default:"waiting"

      t.timestamps
    end
  end
end
