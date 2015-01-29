module GetYourGuide
  module Parsers
    class Destinations < GetYourGuide::Parsers::Default
      def initialize(api_xml)
        super
        @parsed_destinations = []
      end

      def process
        @api_xml.xpath('//destination').each do |destination_xml|
          parsed_destination = parse_simgle_destination destination_xml
          @parsed_destinations << parsed_destination
        end

        @parsed_destinations
      end

      def parse_simgle_destination(destination_xml)
        destination_attributes = {
          :provider_id => destination_xml.attr('id').to_i,
          :name => destination_xml.xpath('name').children.inner_text,
          :country => destination_xml.attr('country').to_s,
          :destination_type => destination_xml.attr('type').to_s
        }

        if destination_xml.xpath('.//alias').children.size > 0
          destination_attributes[:unlocode] = destination_xml.xpath('.//alias').children.first.inner_text
          destination_attributes[:iata]     = destination_xml.xpath('.//alias').children.last.inner_text
        end

        GetYourGuide::Models::Destination.new(destination_attributes)
      end
    end
  end
end
