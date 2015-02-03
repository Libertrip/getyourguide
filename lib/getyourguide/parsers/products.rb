module GetYourGuide
  module Parsers
    class Products < GetYourGuide::Parsers::Default
      def initialize(api_xml)
        super
        @parsed_activities = []
      end

      def process
        @api_xml.xpath('//product').each do |product_xml|
          parsed_activity = parse_simgle_product product_xml
          @parsed_activities << parsed_activity
        end

        @parsed_activities
      end

      def parse_simgle_product(product_xml)
        attributes = {
          provider_id: product_xml.attr('id').to_i,
          title: product_xml.xpath('title').children.inner_text,
          abstract: product_xml.xpath('abstract').children.inner_text,
          categories: get_categories_list(product_xml),
          locations: get_locations_list(product_xml),
          starting_point: get_starting_point_list(product_xml),
          indivative_price: get_indivative_price(product_xml),
          rating: product_xml.xpath('rating').children.inner_text.to_f,
          pictures: get_pictures_list(product_xml)
        }

        GetYourGuide::Models::Activity.new attributes
      end
    end
  end
end
