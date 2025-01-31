# == Schema Information
#
# Table name: categories
#
#  id         :string           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  icon       :string
#

class Category < ApplicationRecord
    self.primary_key = :id
    has_many :news, dependent: :destroy
    validates :name, presence: true, uniqueness: true
    before_create :set_uuid
    

    private

    def set_uuid
        self.id = SecureRandom.uuid if id.blank?
    end
end

