module Correction::Presenter
  class Show < Disposable::Twin
    property :id
    property :uuid
    property :post_id
    property :user_id

    collection :segment_corrections, twin: ::SegmentCorrection::Presenter::Show
  end
end
