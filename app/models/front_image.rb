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

class FrontImage < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  mount_uploader :image, BackgroundUploader

  validates_presence_of :image

  scope :published, -> { where(published: true) }


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

