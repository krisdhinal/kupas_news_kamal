class AddReadTimeToNews < ActiveRecord::Migration[8.0]
  def change
    add_column :news, :read_time, :integer
  end
end
