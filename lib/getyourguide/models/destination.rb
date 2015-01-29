module GetYourGuide
  module Models
    class Destination
      attr_accessor :provider_id, :name, :country, :unlocode, :iata, :destination_type

      def initialize(attributes)
        @provider_id      = attributes[:provider_id]
        @name             = attributes[:name]
        @country          = attributes[:country]
        @unlocode         = attributes[:unlocode]
        @iata             = attributes[:iata]
        @destination_type = attributes[:destination_type]
      end
    end
  end
end
