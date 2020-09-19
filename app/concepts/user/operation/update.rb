module User::Operation
  class Update < Trailblazer::Operation
    step :setup_model
    step Contract::Build(constant: User::Contract::Update)
    step Contract::Validate()
    step Contract::Persist()

    fail :puts_error

    def puts_error(ctx, **)
      puts ctx
    end

    step :setup_presented

    def setup_model(ctx, params:, **)
      puts params[:id]
      ctx[:model] = ::User::Operation::Show.(params: params)[:model]
    end

    def setup_presented(ctx, **)
      ctx[:presented] = User::Presenter::Show.new(ctx[:model])
    end
  end
end
