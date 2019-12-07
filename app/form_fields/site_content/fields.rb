class SiteContent::Fields < ApplicationFields
  
  TEXT_FORM_FIELDS = [:text, :site, :type]
  IMAGE_FORM_FIELDS = [X(:image, type: :file, hide_name: true), X(:type, type: :hidden, hide_name: true)]
  IMAGE_FORM_FIELDS = [X(:image, type: :file, hide_name: true)]
  
end
