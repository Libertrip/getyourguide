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
          locations << create_model('Location', {
            :provider_id => location.attr('id').to_i,
            :name => location.inner_text,
            :country => location.attr('country'),
            :start_location => !location.attr('start_location').nil?
          })
        end

        locations
      end

      def get_categories_list(product_xml)
        categories = []

        product_xml.xpath('categories').children.each do |category|
          categories << create_model('Category', {
            :provider_id => category.attr('id').to_i,
            :name => category.inner_text
          })
        end

        categories
      end

      def get_pictures_list(pictures_xml)
        pictures = []

        pictures_xml.xpath('pictures').children.children.each do |picture|
          unless picture.inner_text == ''
            pictures << create_model('Image', {
              :ssl => to_boolean(picture.attr('ssl')),
              :url => picture.inner_text
            })
          end
        end

        pictures
      end

      def create_model(model_name, attributes)
        Object.const_get("GetYourGuide::Models::#{model_name}").new attributes
      end

      def to_boolean(input)
        input == 'true'
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
