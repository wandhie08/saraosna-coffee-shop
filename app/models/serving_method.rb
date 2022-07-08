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

class ServingMethod < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :image, ImageUploader

  has_many :serving_types
  has_many :orders

  scope :visible, -> { where(visible: true) }
  scope :hide, -> { where(visible: false) }

  def should_generate_new_friendly_id?
    name_changed?
  end

  def visible_false!
    self.visible = false
    self.save!
  end

  def visible_true!
    self.visible = true
    self.save!
  end

end
