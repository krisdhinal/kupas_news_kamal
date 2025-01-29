class AddCategoryToNews < ActiveRecord::Migration[8.0]
  def up
    add_reference :news, :category, null: true, foreign_key: true

    # Set default category untuk data lama
    default_category = Category.first || Category.create(name: "Politik")
    News.update_all(category_id: default_category.id)

    # Setelah semua data memiliki category_id, ubah menjadi NOT NULL
    change_column_null :news, :category_id, false
  end

  def down
    remove_reference :news, :category
  end
end

