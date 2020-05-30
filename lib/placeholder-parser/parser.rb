# encoding: UTF-8

module PlaceholderParser
  class Parser
    class << self
      def identify(string)
        extract_pieces(string).map { |match| new(match) }
      end

      def extract(string)
        extract_pieces(string).map(&:join)
      end

      protected

      def extract_pieces(string)
        string.scan(regex)
      end
    end

    protected

    def numberize(value_str)
      value_str.to_i if value_str =~ /\A[\d]+\z/
    end
  end
end
