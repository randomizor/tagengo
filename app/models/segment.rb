class Segment < ApplicationRecord
  belongs_to :post
  has_many   :segment_corrections
end
