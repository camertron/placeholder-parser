# encoding: UTF-8

module PlaceholderParser
  class Ios < Parser
    REGEX = Regexp.new(
      '%' +                # percent sign
      '([1-9]*)?' +        # optional argument index
      '([,+ (\-0#$]*)?' +  # optional flags
      '(\d*)?' +           # optional length modifier (width)
      '(?:\.([\d]*))?' +   # optional precision (followed by a mandatory conversion type)
      '(%|@|[dDuUxXoOfFeEgGcCsSpaA]{1,2})'
    )

    def self.regex
      REGEX
    end

    attr_reader :argument_index, :flags, :width
    attr_reader :precision, :conversion_type

    def initialize(pieces)
      (
        @argument_index,
        @flags,
        @width,
        @precision,
        @conversion_type
      ) = pieces

      @argument_index = numberize(@argument_index)
      @width = numberize(@width)
      @precision = numberize(@precision)
    end
  end
end
