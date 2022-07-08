# == Schema Information
#
# Table name: serving_methods
#
#  id          :bigint           not null, primary key
#  description :string
#  image       :string
#  name        :string
#  notes       :string
#  slug        :string
#  visible     :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_serving_methods_on_slug  (slug) UNIQUE
#

class ServingMethodSerializer < ApplicationSerializer
  attributes :id, :name, :image, :description, :notes, :available
  has_many :serving_types

  attribute :image do |object|
    image_url(object)
  end

  attribute :serving_types do |object|
    ServingTypeSerializer.new(object.serving_types).as_json["data"]
    # object.serving_types.visible
    # ServingTypeSerializer.new(object.serving_types)
  end

  attribute :notes do |object|
    object.visible? ? nil : object.notes
  end

  attribute :available do |object|
    object.visible
  end

end
