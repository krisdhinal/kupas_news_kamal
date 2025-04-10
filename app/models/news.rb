# == Schema Information
#
# Table name: news
#
#  id          :string           not null, primary key
#  title       :string
#  body        :text
#  image       :string
#  category_id :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  read_time   :integer
#

class News < ApplicationRecord
  # has_one_attached :image
  self.primary_key = :id
  belongs_to :category, optional: true
  before_create :set_uuid
  before_save :calculate_read_time

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

  def set_uuid
    self.id = SecureRandom.uuid if id.blank?
  end

  def image_size_validation
    if image.present? && image.size > 2.megabytes
      errors.add(:image, "File anda terlalu besar. Maksimal ukuran file adalah 2 MB.")
    end
  end

  def calculate_read_time
    words_per_minute = 200.0
    word_count = body.split.size
    self.read_time = (word_count / words_per_minute).ceil
  end
end
