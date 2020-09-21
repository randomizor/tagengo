module Prompt::Operation
  class Show < Trailblazer::Operation
    step :find_model
    step :setup_presenter

    def find_model(ctx, params:, **)
      ctx[:model] = Prompt.find(params[:id])
    end

    def setup_presenter(ctx, model:, **)
      ctx[:presented] = Prompt::Presenter::Show.new(ctx[:model])
    end
  end
end
