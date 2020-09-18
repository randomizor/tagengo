module Correction::Operation
  class Index < Trailblazer::Operation
    step :find_model
    step :setup_presenter

    def find_model(ctx, **)
      ctx[:model] = Correction.all
    end

    def setup_presenter(ctx, **)
      ctx[:presented] = Post::Presenter::Index.from_collection(ctx[:model])
    end
  end
end
