module UserLanguage::Presenter
  class Show < Disposable::Twin
    require 'disposable/twin/persisted'
    feature Disposable::Twin::Persisted
    feature Save
    feature Sync

    property :id
    property :uuid
    property :language_id
    property :level_id
    property :user_id
  end
end
