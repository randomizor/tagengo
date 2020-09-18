module Post::Presenter
  class Show < Disposable::Twin
    property :id
    property :uuid
    property :title
    property :entry
    property :tag_list

    property :user, twin: User::Presenter::Show

    property :category do
      property :uuid
      property :name
    end

    property :language do
      property :uuid
      property :name
      property :code
    end

    property :level do
      property :uuid
      property :name
    end
  end
end
