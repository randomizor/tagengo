module Prompt::Cell
  class Prompt < Trailblazer::Cell
    include ::Cell::Erb
    property :prompt
    property :user
    property :level
    property :language

    private

    def level_name
      level.name
    end

    def language_name
      language.name
    end
  end
end
