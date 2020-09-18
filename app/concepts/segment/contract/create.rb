module Segment::Contract
  class Create < Reform::Form
    property :segment
    property :post_id

    validation name: :default do
      params do
        required(:segment).filled
        required(:post_id).filled
      end
    end

    model :segment
  end
end
