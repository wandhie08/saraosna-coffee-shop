# == Schema Information
#
# Table name: parameters
#
#  id          :bigint           not null, primary key
#  alias       :string
#  description :string
#  name        :string
#  slug        :string
#  value       :string
#  values      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_parameters_on_alias  (alias) UNIQUE
#  index_parameters_on_slug   (slug) UNIQUE
#

require 'test_helper'

class ParameterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
