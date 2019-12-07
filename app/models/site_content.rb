class SiteContent < ApplicationRecord
  default_scope -> { order(order_number: :asc) }
  has_one_attached :image
  belongs_to :parent, class_name: 'SiteContent', optional: true
  has_many :children, class_name: 'SiteContent', foreign_key: 'parent_id', dependent: :destroy
  enum type: [:nav_logo, :teaser_image, :teaser_text, :text, :image, :image_gallery]
  attr_accessor :parent_type
  enum site: CompactCms.sites
  self.inheritance_column = :type_
  
  before_create :set_order_number
  
  def set_order_number
    self.order_number = SiteContent.maximum(:order_number).to_i + 1
  end
  
  include SiteContent::Ordering
  
  def editable?
    type != 'image_gallery'
  end
  
end
