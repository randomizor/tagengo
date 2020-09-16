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

  after_create do |post|
    ps = PragmaticSegmenter::Segmenter.new(text: post.entry, language: post.language.code)

    ps.segment.each do |segment|
      post.segments.create(segment: segment)
    end
  end
end
