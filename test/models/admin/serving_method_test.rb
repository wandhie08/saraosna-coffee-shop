# == Schema Information
#
# Table name: admin_serving_methods
#
#  id          :bigint           not null, primary key
#  description :string
#  image       :string
#  name        :string
#  slug        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_admin_serving_methods_on_slug  (slug) UNIQUE
#

require 'test_helper'

class Admin::ServingMethodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
