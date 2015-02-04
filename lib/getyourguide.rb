require "getyourguide/version"
require "getyourguide/api_client"
require "getyourguide/models/generator"
require "getyourguide/errors/api_error"
require "getyourguide/parsers/default"
require "getyourguide/parsers/categories"
require "getyourguide/parsers/destinations"
require "getyourguide/parsers/image_formats"
require "getyourguide/parsers/products"
require "getyourguide/parsers/top_categories"

module GetYourGuide
end

GetYourGuide::Models.generate_models
