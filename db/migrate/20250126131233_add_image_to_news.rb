class AddImageToNews < ActiveRecord::Migration[8.0]
  def change
    add_column :news, :image, :string
  end
end
