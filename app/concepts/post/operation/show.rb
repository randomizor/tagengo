module Post::Operation
  class Show < Trailblazer::Operation
    step :find_model
    step :setup_presenter

    def find_model(ctx, params:, **)
      ctx[:model] = Post.find(params[:id])
    end

    def setup_presenter(ctx, model:, **)
      ctx[:presented] = Post::Presenter::Show.new(ctx[:model])
    end
  end
end
