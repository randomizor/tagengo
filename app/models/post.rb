class Post < ApplicationRecord
  belongs_to :user
  belongs_to :language
  belongs_to :level
  belongs_to :prompt, required: false
  belongs_to :category

  has_many :segments
  has_many :corrections
  has_many :segment_corrections, through: :segments

  accepts_nested_attributes_for :corrections

  acts_as_taggable_on :tags

  def self.list(filter)
    by_user(filter[:user_id]).
    limit(filter[:limit] || 10)
  end

  def self.by_user(user_id)
    return self if user_id.nil?
    where(user_id: user_id)
  end
end
