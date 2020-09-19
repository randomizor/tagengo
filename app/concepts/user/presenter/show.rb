module User::Presenter
  class Show < Disposable::Twin
    require 'disposable/twin/persisted'
    feature Disposable::Twin::Persisted
    feature Save
    feature Sync

    property :id
    property :uuid
    property :username
    property :about

    collection :languages_native,   twin: Language::Presenter::Show
    collection :languages_learning, twin: Language::Presenter::Show

    collection :native_languages,   twin: UserLanguage::Presenter::Show
    collection :learning_languages, twin: UserLanguage::Presenter::Show

    def to_key
      [:user]
    end
  end
end
