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
  # Define a search scope for SQLite
  scope :search, ->(query) {
    if connection.adapter_name.downcase.include?('sqlite')
      where('title LIKE ?', "%#{query}%")
    else
      where('title ILIKE ?', "%#{query}%")
    end
  }
end
