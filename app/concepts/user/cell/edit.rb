module User::Cell
  class Edit < Trailblazer::Cell
    include ActionView::Helpers::FormOptionsHelper
    include ::Cell::Erb
    property :levels
    property :languages

    def form
      ::User::Contract::Update.new(model)
    end

    private

    def my_fields_for(form, sym, &block)
      form.fields_for sym do |subfields|
        (yield subfields).html_safe
      end
    end

    def language_options
      options[:languages].map{|l| [l.name, l.id]}
    end

    def level_options
      options[:languages].map{|l| [l.name, l.id]}
    end
  end
end
