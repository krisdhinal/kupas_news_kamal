# == Schema Information
#
# Table name: news
#
#  id          :integer          not null, primary key
#  title       :string
#  body        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#  category_id :integer
#
# Indexes
#
#  index_news_on_category_id  (category_id)
#

class News < ApplicationRecord
  # has_one_attached :image
  belongs_to :category
  mount_uploader :image, ImageUploader

  validate :image_size_validation
  validates :title, presence: true
  validates :body, presence: true
  validates :category_id, presence: true
  # Define a search scope for SQLite
  scope :search, ->(query) {
    if connection.adapter_name.downcase.include?('sqlite')
      where('title LIKE ?', "%#{query}%")
    else
      where('title ILIKE ?', "%#{query}%")
    end
  }

  private

  def image_size_validation
    if image.present? && image.size > 2.megabytes
      errors.add(:image, "File anda terlalu besar. Maksimal ukuran file adalah 2 MB.")
    end
  end
end
