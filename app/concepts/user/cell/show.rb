module User::Cell
  class Show < Trailblazer::Cell
    include ::Cell::Erb
    property :about
    property :edit_link

    private

    def edit_link
      link_to 'Edit Profile', edit_user_url(model.id)
    end

    def latest_posts
      options[:latest_posts]
    end
  end
end
