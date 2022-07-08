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

class Parameter < ApplicationRecord
  # audited
  extend FriendlyId

  friendly_id :alias, use: :slugged

  serialize :values, Array

  validates_uniqueness_of :alias

  ALIASES = self.pluck(:alias)

  before_save :remove_blank_values

  self::ALIASES.each do |nickname|
    scope nickname.downcase.to_sym, -> { where(alias: nickname).first }
  end

  def remove_blank_values
    values.reject!(&:blank?)
  end
  
end
