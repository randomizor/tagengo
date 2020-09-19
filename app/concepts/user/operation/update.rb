module User::Operation
  class Update < Trailblazer::Operation
    step :setup_model
    step Contract::Build(constant: User::Contract::Update)
    step Contract::Validate()
    step Contract::Persist()
    step :setup_presented

    def setup_model(ctx, params:, **)
      ctx[:model] = ::User::Operation::Show.(params: params)[:model]
    end

    def setup_presented(ctx, **)
      ctx[:presented] = User::Presenter::Show.new(ctx[:model])
    end
  end
end
