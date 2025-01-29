# == Schema Information
#
# Table name: news
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string
#

class News < ApplicationRecord
  # has_one_attached :image
  mount_uploader :image, ImageUploader

  validate :image_size_validation
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
