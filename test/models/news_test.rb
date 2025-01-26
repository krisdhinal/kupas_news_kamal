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

require "test_helper"

class NewsTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
