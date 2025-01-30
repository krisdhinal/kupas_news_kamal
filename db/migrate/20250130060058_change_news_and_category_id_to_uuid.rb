class ChangeNewsAndCategoryIdToUuid < ActiveRecord::Migration[8.0]
  def change
    # Buat tabel baru dengan UUID sebagai primary key
    create_table :new_categories, id: false do |t|
      t.string :id, primary_key: true
      t.string :name
      t.timestamps
    end

    create_table :new_news, id: false do |t|
      t.string :id, primary_key: true
      t.string :title
      t.text :body
      t.string :image
      t.string :category_id # Foreign key juga pakai string (UUID)
      t.timestamps
    end

    # Pindahkan data dari tabel lama ke tabel baru
    execute "INSERT INTO new_categories (id, name, created_at, updated_at) SELECT lower(hex(randomblob(16))), name, created_at, updated_at FROM categories;"
    execute "INSERT INTO new_news (id, title, body, image, category_id, created_at, updated_at) SELECT lower(hex(randomblob(16))), title, body, image, category_id, created_at, updated_at FROM news;"

    # Hapus tabel lama
    drop_table :news
    drop_table :categories

    # Ubah nama tabel baru menjadi tabel utama
    rename_table :new_categories, :categories
    rename_table :new_news, :news
  end
end
