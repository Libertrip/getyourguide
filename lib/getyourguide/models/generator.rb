module GetYourGuide
  module Models
    MODEL_NAMES = %w[Activity Category Destination Image ImageFormat Location TopCategory]
    MODEL_ATTRIBUTES = {
      'Activity' => [:provider_id, :title, :abstract, :categories, :locations, :starting_point, :indivative_price, :rating, :pictures],
      'Category' => [:provider_id, :name],
      'Destination' => [:provider_id, :name, :country, :unlocode, :iata, :destination_type],
      'Image' => [:url, :ssl],
      'ImageFormat' => [:provider_id, :width, :height, :comment],
      'Location' => [:provider_id, :name, :country, :start_location],
      'TopCategory' => [:provider_id, :name, :link, :picture, :rating]
    }

    def self.generate_models
      GetYourGuide::Models::MODEL_NAMES.each do |klass_name|
        klass_vars  = GetYourGuide::Models::MODEL_ATTRIBUTES[klass_name.to_s]
        klass       = generate_class klass_vars

        const_set klass_name, klass
      end
    end

    def self.generate_class(klass_vars)
      Class.new do
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
            instance_variable_set("@#{field}", args[field])
          end
        end
      end
    end
  end
end
