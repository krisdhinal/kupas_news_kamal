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

require "test_helper"

class NewsTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
