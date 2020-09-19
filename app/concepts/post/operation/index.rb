module Post::Operation
  class Index < Trailblazer::Operation
    step :find_model
    step :setup_presenter

    def find_model(ctx, **)
      ctx[:model] = Post.list(ctx[:params] || {})
    end

    def setup_presenter(ctx, **)
      ctx[:presented] = Post::Presenter::Show.from_collection(ctx[:model])
    end
  end
end
