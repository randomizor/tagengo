module SegmentCorrection::Contract
  class Create < Reform::Form
    property :segment_id
    property :correction_id
    property :entry
    property :comment

    model :segment_correction
  end
end
