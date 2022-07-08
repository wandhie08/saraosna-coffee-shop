# == Schema Information
#
# Table name: coffee_beans
#
#  id                        :bigint           not null, primary key
#  area                      :string
#  available_at              :string
#  description               :string
#  elevation                 :string
#  image                     :string
#  is_recommendation         :boolean          default(FALSE)
#  kind_of_coffee            :string
#  name                      :string
#  notes                     :string
#  orders_count              :integer          default(0), not null
#  process                   :string
#  slug                      :string
#  stock                     :integer          default(0)
#  stock_available           :integer          default(0)
#  varietas                  :string
#  visible                   :boolean          default(TRUE)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  serving_recommendation_id :integer
#
# Indexes
#
#  index_coffee_beans_on_slug  (slug) UNIQUE
#

require 'test_helper'

class CoffeeBeanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
