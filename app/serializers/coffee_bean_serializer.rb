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

class CoffeeBeanSerializer < ApplicationSerializer
  attributes :id, :name, :image, :description, :kind_of_coffee, :area, :stock, :visible, :available, :available_at, :elevation, :is_recommendation, :varietas, :process, :notes, :serving_method_name, :serving_method_id, :serving_recommendation_id, :serving_recommendation, :serving_types

  attribute :image do |object|
    image_url(object)
  end

  attribute :serving_method_name do |object|
    object.recommendation.serving_method.name
  end

  attribute :serving_method_id do |object|
    object.recommendation.serving_method.id
  end

  attribute :serving_types do |object|
    ServingTypeSerializer.new(object.recommendation)
  end

  attribute :serving_recommendation do |object|
    object.recommendation.name
  end

  attribute :stock do |object|
    object.available? ? "Available" : "Out of stock"
  end

  attribute :available do |object|
    object.available?
  end

  attribute :available_at do |object|
    object.available? ?  " " : object.available_at
  end

end
