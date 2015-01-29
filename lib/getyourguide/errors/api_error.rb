module GetYourGuide
  module Errors
    class ApiError < StandardError
      attr_reader :object

      def initialize
        @object = 'GetYourGuide API Error'
      end
    end
  end
end
