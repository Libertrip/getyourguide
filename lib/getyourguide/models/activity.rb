module GetYourGuide
  module Models
    class Activity
      attr_accessor :provider_id, :title, :abstract, :categories, :destinations, :starting_point, :indivative_price, :rating, :pictures

      def initialize(attributes)
        @provider_id      = attributes[:provider_id]
        @title            = attributes[:title]
        @abstract         = attributes[:abstract]
        @categories       = attributes[:categories]
        @destinations     = attributes[:destinations]
        @starting_point   = attributes[:starting_point]
        @indivative_price = attributes[:indivative_price]
        @rating           = attributes[:rating]
        @pictures         = attributes[:pictures]
      end
    end
  end
end
