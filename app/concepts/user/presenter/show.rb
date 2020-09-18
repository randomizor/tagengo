class User::Presenter::Show < Disposable::Twin
  property :username

  collection :languages_native,   twin: Language::Presenter::Show
  collection :languages_learning, twin: Language::Presenter::Show
end
