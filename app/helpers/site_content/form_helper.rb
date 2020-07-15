module SiteContent::FormHelper
  
  def site_content_image_form record
    attachment = record.image
    if false && attachment.attached?
      link_to 'delete', delete_attachment_path(attachment.id), method: :delete, **are_you_sure_confirm, class: 'site-content-delete-button'
    else
      form_for record, html: { class: 'site-content-form' } do |f|
        concat f.file_field :image, multiple: false, direct_upload: false
        concat f.hidden_field :type
        concat f.hidden_field :site
        concat f.hidden_field :order_number
        concat f.submit 'save', class: attachment.attached? ? '' : 'alone'
        concat delete_button(record) if attachment.attached?
      end
    end
  end
  
  def site_content_text_form record, **options
    form_for record, html: { class: 'site-content-form site-content-text-form' } do |f|
      concat f.text_area :text, data: options.slice(:editable)
      concat f.hidden_field :type
      concat f.hidden_field :site
      concat (tag.div class: 'buttons' do
        concat f.submit 'save'
        concat tag.span 'close', class: 'close-button'
      end)
    end
  end
  
end
