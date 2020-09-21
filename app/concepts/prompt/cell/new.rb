module Prompt::Cell
  class New < Trailblazer::Cell
    include ActionView::Helpers::FormOptionsHelper
    include ::Cell::Erb
    property :prompt
    property :levels
    property :languages

    def form
      ::Prompt::Contract::Create.new(::Prompt.new)
    end

    private

    def language_options
      languages.map{|l| [l.name, l.id]}
    end

    def level_options
      levels.map{|l| [l.name, l.id]}
    end
  end
end
