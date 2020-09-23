module Correction::Operation
  class Create < Trailblazer::Operation
    step :setup_model
    step Contract::Build(constant: Correction::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()
    step :setup_presenter

    def setup_model(ctx, **)
      ctx[:model] = Correction.new
    end

    def setup_presenter(ctx, **)
      ctx[:presented] = Correction::Presenter::Show.new(ctx[:model])
    end
  end
end
