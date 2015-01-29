module GetYourGuide
  require 'nokogiri'
  require 'open-uri'

  class ApiClient
    def initialize(partner_id, forced_language = nil)
      @partner_id = partner_id
      if forced_language.nil?
        @forced_language  = 'en'
      else
        @forced_language  = forced_language
      end
      @base_request_url   = construct_base_url
    end

    def call(options)
      @options = options

      xml = Nokogiri::XML(open(construct_formated_url)) do |config|
        config.nonet
        config.noblanks
      end

      xml.remove_namespaces!

      return_xml_or_raise_error xml
    end

    def call_and_parse(options)
      api_xml         = call options
      product_parser  = get_good_parser.new(api_xml)
      product_parser.process
    end

    private

    def construct_base_url
      "#{api_base_url}?#{get_language_string}&#{get_partner_id_string}"
    end

    def construct_formated_url
      request_url = @base_request_url

      @options.keys.each do |key|
        request_url += "&#{key}=#{@options[key]}"
      end

      request_url
    end

    def return_xml_or_raise_error(xml)
      if xml.xpath('.//errors').size > 0
        raise Errors::ApiError.new, xml.xpath('.//error').inner_text
      else
        xml
      end
    end

    def get_good_parser
      if available_query_list.include? @options[:q]
        case @options[:q]
        when 'product_list'
          GetYourGuide::Parsers::Products
        when 'destination_list'
          GetYourGuide::Parsers::Destinations
        when 'image_format_list'
          GetYourGuide::Parsers::ImageFormats
        when 'category_list'
          GetYourGuide::Parsers::Categories
        when 'top_categories'
          GetYourGuide::Parsers::TopCategories
        end
      else
        raise Errors::ApiError.new, "Your :q key (#{@options[:q]}:#{@options[:q].class}) doesnt match with an available query."
      end
    end

    def available_query_list
      [
        'product_list',
        'destination_list',
        'image_format_list',
        'category_list',
        'top_categories'
      ]
    end

    def api_base_url
      'https://api.getyourguide.com/'
    end

    def get_partner_id_string
      "partner_id=#{@partner_id}"
    end

    def get_language_string
      "language=#{@forced_language.to_s}"
    end
  end
end
