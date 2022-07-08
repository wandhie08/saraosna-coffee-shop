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

class Background < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  mount_uploader :image, BackgroundUploader

  validates_presence_of :image
  # validates_uniqueness_of :position


  # def self.random_image
  #   images = []
  #   Background.all.each do |background|
  #     images.push({
  #       id: background.id,
  #       image: "/uploads/background/image/#{background.id}/#{background.image.file.filename}",
  #       color: background.color
  #     })
  #   end
  #   return images
  # end

  def file_data
    [
      {
        name: self.image.file.filename,
        size: self.image.size,
        type: "image/#{self.image.file.extension}",
        file: self.image.url,
        data: {
          thumbnail: self.image.url,
          popup: true
        }
      }
    ]
  end

  private

    def slug_candidates
      [SecureRandom.uuid]
    end
  
end
