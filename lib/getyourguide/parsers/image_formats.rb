module GetYourGuide
  module Parsers
    class ImageFormats < GetYourGuide::Parsers::Default
      def initialize(api_xml)
        super
        @parsed_image_formats = []
      end

      def process
        @api_xml.xpath('//image_format').each do |image_format_xml|
          parsed_image_format = parse_simgle_image_format image_format_xml
          @parsed_image_formats << parsed_image_format
        end

        @parsed_image_formats
      end

      def parse_simgle_image_format(image_format_xml)
        create_model('ImageFormat', {
          :provider_id => image_format_xml.attr('id').to_i,
          :width => image_format_xml.xpath('width').children.inner_text.to_i,
          :height => image_format_xml.xpath('height').children.inner_text.to_i,
          :comment => image_format_xml.xpath('comment').children.inner_text
        })
      end
    end
  end
end
