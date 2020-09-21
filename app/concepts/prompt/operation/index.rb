module Prompt::Operation
  class Index < Trailblazer::Operation
    step :find_model
    step :setup_presenter

    def find_model(ctx, **)
      ctx[:model] = Prompt.list(ctx[:params] || {})
    end

    def setup_presenter(ctx, **)
      ctx[:presented] = Prompt::Presenter::Show.from_collection(ctx[:model])
    end
  end
end
