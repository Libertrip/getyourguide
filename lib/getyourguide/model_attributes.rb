module GetYourGuide
  MODEL_NAMES = %w[Activity Category Destination Image ImageFormat Location TopCategory]
  MODEL_ATTRIBUTES = {
    'Activity' => [:a],
    'Category' => [:b],
    'Destination' => [:c],
    'Image' => [:d],
    'ImageFormat' => [:e],
    'Location' => [:f],
    'TopCategory' => [:g],
  }
end
