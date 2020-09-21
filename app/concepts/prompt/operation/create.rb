module Prompt::Operation
  class Create < Trailblazer::Operation
    step :setup_model
    step Contract::Build(constant: Prompt::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()
    step :setup_presenter

    def setup_model(ctx, **)
      ctx[:model] = Prompt.new
    end

    def setup_presenter(ctx, **)
      ctx[:presented] = Prompt::Presenter::Show.new(ctx[:model])
    end
  end
end
