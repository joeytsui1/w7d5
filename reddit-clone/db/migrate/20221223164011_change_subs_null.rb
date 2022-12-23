class ChangeSubsNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :subs, :description, false
  end
end
