module Textdiff::Cell
  class Show < Trailblazer::Cell

    private

    def first_sentence
      model.first
    end

    def second_sentence
      model[1]
    end

    def sdiff
      Diff::LCS.sdiff(first_sentence, second_sentence)
    end

    def highlighted_text
      corrected = []
      sdiff.each do |change, original, new_text|
        case change
        when '-'
          corrected << '<del>' + original[1] + '</del>'
        when '+'
          corrected << '<span class="correction addition">' + new_text[1] + '</span>'
        when '!'
          corrected << '<span class="correction change">' + new_text[1] + '</span>'
        else
          corrected << new_text[1]
        end
      end

      corrected.join.html_safe
    end
  end
end
