module SiteContent::Ordering
  
  def change_order change
    
    return if parent_id.blank? && site.blank?
    
    original_order_number = order_number
    direction = change > 0 ? '>' : '<'
    
    if parent_id.present?
      where_query = { parent: parent }
    elsif site.present?
      where_query = { site: site }
    end
    
    siblings = SiteContent.where(**where_query)
    new_order_number = siblings.where('order_number '+direction+' ?', original_order_number)
    new_order_number = change > 0 ? new_order_number.minimum(:order_number) : new_order_number.maximum(:order_number)
    relation = siblings.where(order_number: new_order_number)
    
    return if new_order_number.blank?
    relation&.update order_number: original_order_number
    update order_number: new_order_number
    
  end
  
end
