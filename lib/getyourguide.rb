require "getyourguide/version"
require "getyourguide/model_attributes"
require "getyourguide/api_client"
require "getyourguide/errors/api_error"
require "getyourguide/parsers/default"
require "getyourguide/parsers/categories"
require "getyourguide/parsers/destinations"
require "getyourguide/parsers/image_formats"
require "getyourguide/parsers/products"
require "getyourguide/parsers/top_categories"

module GetYourGuide
  module Models
    GetYourGuide::MODEL_NAMES.each do |klass_name|
      klass_vars  = GetYourGuide::MODEL_ATTRIBUTES[klass_name.to_s]
      klass       = Class.new do
        klass_vars.each do |field|
          define_method field.intern do
            instance_variable_get("@#{field}")
          end
          define_method "#{field}=".intern do |arg|
            instance_variable_set("@#{field}", arg)
          end
        end
        define_method :initialize do |args|
          klass_vars.each do |field|
            binding.pry
            instance_variable_set("@#{field}", args[field])
          end
        end
      end

      const_set klass_name, klass
    end
  end
end
