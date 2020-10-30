class TradeableStatusToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :t_status, :boolean, :default => false
  end
end
