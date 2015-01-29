module GetYourGuide
  module Models
    class Location
      attr_accessor :provider_id, :name, :country, :start_location

      def initialize(attributes)
        @provider_id    = attributes[:provider_id]
        @name           = attributes[:name]
        @country        = attributes[:country]
        @start_location = attributes[:start_location]
      end
    end
  end
end
