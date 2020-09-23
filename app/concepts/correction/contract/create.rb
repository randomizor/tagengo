module Correction::Contract
  class Create < Reform::Form
    property :post_id
    property :user_id

    collection :segment_corrections,  form: SegmentCorrection::Contract::Create,
                                      populate_if_empty: -> (_options){ SegmentCorrection.new }

    model :correction
  end
end
