module Correction::Cell
  class Show < Trailblazer::Cell
    include ::Cell::Erb

    property :user
    property :segment_corrections
    property :segment
  end
end
