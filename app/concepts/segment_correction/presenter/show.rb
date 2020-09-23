module SegmentCorrection::Presenter
  class Show < Disposable::Twin
    property :id
    property :uuid
    property :segment_id
    property :correction_id

    property :entry
    property :comment
  end
end
