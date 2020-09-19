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

    collection :native_languages,   twin: Language::Presenter::Show
    collection :learning_languages, twin: Language::Presenter::Show

    collection :user_native_languages,   twin: UserNativeLanguage::Presenter::Show
    collection :user_learning_languages, twin: UserLearningLanguage::Presenter::Show

    def to_key
      [:user]
    end
  end
end
