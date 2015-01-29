module GetYourGuide
  module Models
    class TopCategory
      attr_accessor :provider_id, :name, :link, :picture, :rating

      def initialize(attributes)
        @provider_id = attributes[:provider_id]
        @name        = attributes[:name]
        @link        = attributes[:link]
        @picture     = attributes[:picture]
        @rating      = attributes[:rating]
      end
    end
  end
end
