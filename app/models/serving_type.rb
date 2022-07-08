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

class ServingType < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :image, ImageUploader

  belongs_to :serving_method
  has_many :orders

  scope :espresso_based, -> {where(serving_method_id: 1)}
  scope :manual_brew, -> {where(serving_method_id: 2)}
  scope :order_by_name, -> {order(name: :asc)}
  scope :current_fav, -> { order(orders_count: :desc) }
  scope :visible, -> { where(visible: true) }
  scope :hide, -> { where(visible: false) }

  def should_generate_new_friendly_id?
    name_changed?
  end
  
end
