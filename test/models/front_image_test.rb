# == Schema Information
#
# Table name: front_images
#
#  id         :bigint           not null, primary key
#  image      :string
#  name       :string
#  published  :boolean          default(TRUE)
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_front_images_on_slug  (slug) UNIQUE
#

require 'test_helper'

class FrontImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
