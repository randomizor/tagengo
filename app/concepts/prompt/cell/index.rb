module Prompt::Cell
  class Index < Trailblazer::Cell
    include ::Cell::Erb

    private

    def new_prompt_link
      link_to "New Prompt", new_prompt_url, class: 'button'
    end
  end
end
