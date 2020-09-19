module User::Operation
  class Show < Trailblazer::Operation
    step :find_model
    step :setup_presenter

    def find_model(ctx, params:, **)
      ctx[:model] = User.find(params[:id])
    end

    def setup_presenter(ctx, model:, **)
      ctx[:presented] = User::Presenter::Show.new(ctx[:model])
    end
  end
end
