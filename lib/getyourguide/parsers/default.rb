module GetYourGuide
  module Parsers
    class Default
      def initialize(api_xml)
        @api_xml = api_xml
      end

      private

      def get_locations_list(product_xml)
        locations = []

        product_xml.xpath('destination').children.xpath('location').each do |location|
          location_attributes = {
            :provider_id => location.attr('id').to_i,
            :name => location.inner_text,
            :country => location.attr('country'),
            :start_location => !location.attr('start_location').nil?
          }

          locations << GetYourGuide::Models::Location.new(location_attributes)
        end

        locations
      end

      def get_categories_list(product_xml)
        categories = []

        product_xml.xpath('categories').children.each do |category|
          category_attributes = {
            :provider_id => category.attr('id').to_i,
            :name => category.inner_text
          }

          categories << GetYourGuide::Models::Category.new(category_attributes)
        end

        categories
      end

      def get_pictures_list(product_xml)
        pictures = []

        product_xml.xpath('pictures').children.children.each do |picture|
          pictures << picture.inner_text if picture.inner_text != ''
        end

        pictures
      end

      def get_indivative_price(product_xml)
        product_xml.xpath('price').children.first.children.each do |price|
          return price.children.inner_text.to_f if price.attr('currency') == 'EUR'
        end
      end

      def get_starting_point_list(product_xml)
        {
          :lat => product_xml.xpath('destination').children.last.children.first.inner_text,
          :lng => product_xml.xpath('destination').children.last.children.last.inner_text,
        }
      end
    end
  end
end
