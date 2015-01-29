module GetYourGuide
  module Models
    class Category
      attr_accessor :provider_id, :name

      def initialize(attributes)
        @provider_id = attributes[:provider_id]
        @name        = attributes[:name]
      end
    end
  end
end
