class Correction < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many   :segment_corrections
  has_many   :segments, through: :segment_corrections

  accepts_nested_attributes_for :segment_corrections,
                                reject_if: proc { |attributes| attributes['entry'].blank? }
end
