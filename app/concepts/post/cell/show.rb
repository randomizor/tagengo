module Post::Cell
  class Show < Trailblazer::Cell
    include ::Cell::Erb

    private

    def corrections
      options[:corrections]
    end

    def segments
      options[:segments]
    end
  end
end
