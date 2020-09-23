module Correction::Cell
  class New < Trailblazer::Cell
    include ActionView::Helpers::FormOptionsHelper
    include ::Cell::Erb
    property :post

    def form
      ::Correction::Contract::Create.new(::Correction.new)
    end

    def segments
      post.segments
    end
  end
end
