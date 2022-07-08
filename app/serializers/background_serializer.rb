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

class BackgroundSerializer < ApplicationSerializer
  attributes :id, :review_order, :coffee_bean, :serving_method, :espresso_based, :manual_brew, :image

  attribute :image do |object, params|
    image_url(object)
    # puts("========== Background is random? #{params[:status]}  ==========")
    # if params[:status].eql? 'true'
    #   image_url(Background.all.sample)
    # else
    #   image_url(object)
    # end
  end
  
end
