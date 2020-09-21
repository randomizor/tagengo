module Prompt::Presenter
  class Show < Disposable::Twin
    property :id
    property :uuid
    property :prompt
    property :language, twin: ::Language::Presenter::Show
    property :user,     twin: ::User::Presenter::Show
    property :level,    twin: ::Level::Presenter::Show
  end
end
