module GetYourGuide
  module Models
    class ImageFormat
      attr_accessor :provider_id, :width, :height, :comment

      def initialize(attributes)
        @provider_id  = attributes[:provider_id]
        @width        = attributes[:width]
        @height       = attributes[:height]
        @comment      = attributes[:comment]
      end
    end
  end
end
