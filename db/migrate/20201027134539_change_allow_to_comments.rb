class ChangeAllowToComments < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:comments, :allow, false)
  end
end
