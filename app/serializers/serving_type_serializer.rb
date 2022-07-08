# == Schema Information
#
# Table name: serving_types
#
#  id                :bigint           not null, primary key
#  bean              :string
#  color             :string
#  description       :text
#  image             :string
#  is_recommendation :boolean          default(FALSE)
#  name              :string
#  notes             :string
#  orders_count      :integer          default(0), not null
#  result            :string
#  slug              :string
#  visible           :boolean          default(TRUE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  serving_method_id :bigint
#
# Indexes
#
#  index_serving_types_on_serving_method_id  (serving_method_id)
#  index_serving_types_on_slug               (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (serving_method_id => serving_methods.id)
#

class ServingTypeSerializer < ApplicationSerializer
  attributes :id, :name, :image, :description, :bean, :result, :color, :is_recommendation, :notes, :available

  attribute :image do |object|
    image_url(object)
  end

  attribute :notes do |object|
    object.visible? ? nil : object.notes
  end

  attribute :available do |object|
    object.visible
  end
  
end
