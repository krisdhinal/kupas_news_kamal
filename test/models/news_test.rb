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

require "test_helper"

class NewsTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
