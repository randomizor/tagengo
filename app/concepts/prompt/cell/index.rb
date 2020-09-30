module Prompt::Cell
  class Index < Trailblazer::Cell
    include ::Cell::Erb

    private

    def new_prompt_link
      link_to "New Prompt", new_prompt_url, class: 'btn btn-success float-right'
    end
  end
end
