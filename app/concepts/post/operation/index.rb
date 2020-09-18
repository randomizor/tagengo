module Post::Operation
  class Index < Trailblazer::Operation
    step :find_model
    step :setup_presenter

    def find_model(ctx, **)
      ctx[:model] = Post.all
    end

    def setup_presenter(ctx, **)
      ctx[:presenter] = Post::Presenter::Index.from_collection(ctx[:model])
    end
  end
end
