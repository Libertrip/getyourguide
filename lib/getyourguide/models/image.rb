module GetYourGuide
  module Models
    class Image
      attr_accessor :url, :ssl

      def initialize(attributes)
        @url = attributes[:url]
        @ssl = attributes[:ssl]
      end
    end
  end
end
