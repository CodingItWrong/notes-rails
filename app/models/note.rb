# frozen_string_literal: true

class Note < ApplicationRecord
  extend FriendlyId

  belongs_to :user

  friendly_id :title, use: :scoped, scope: :user

  def should_generate_new_friendly_id?
    title_changed?
  end

  alias_attribute :to_param, :slug

  validates :title, presence: true
end
