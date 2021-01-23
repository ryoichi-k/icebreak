class ChangeColumnToAllowNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :comments, :icebreak_id, true
  end
end
