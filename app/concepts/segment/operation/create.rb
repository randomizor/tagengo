module Segment::Operation
  class Create < Trailblazer::Operation
    step :setup_model
    step Contract::Build(constant: Segment::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()
    step :setup_presenter

    def setup_model(ctx, **)
      ctx[:model] = Segment.new
    end

    def setup_presenter(ctx, **)
      ctx[:presenter] = Segment::Presenter::Show.new(ctx[:model])
    end
  end
end
