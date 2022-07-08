# == Schema Information
#
# Table name: backgrounds
#
#  id             :bigint           not null, primary key
#  coffee_bean    :string
#  color          :string
#  espresso_based :string
#  image          :string
#  manual_brew    :string
#  position       :string
#  review_order   :string
#  serving_method :string
#  slug           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_backgrounds_on_position  (position) UNIQUE
#  index_backgrounds_on_slug      (slug) UNIQUE
#

require 'test_helper'

class BackgroundTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
