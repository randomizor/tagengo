module Post::Operation
  class Create < Trailblazer::Operation
    step :setup_model
    step Contract::Build(constant: Post::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()
    step :setup_presenter

    def setup_model(ctx, **)
      ctx[:model] = Post.new
    end

    def setup_presenter(ctx, **)
      ctx[:presenter] = Post::Presenter::Show.new(ctx[:model])
    end
  end
end
