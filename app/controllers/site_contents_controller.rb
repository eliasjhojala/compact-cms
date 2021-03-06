class SiteContentsController < ApplicationController
  include DefaultActions

  def new
    form model.new(params.permit(:site, :type, :parent_type, :parent_id, :order_number))
  end
  
  def after_save r
    after_commit r
  end
  
  def permitted_params
    params.require(model.name.underscore.gsub('/', '_').to_sym).permit([:parent_id, :parent_type, :order_number, permit_fields(model::Fields::TEXT_FORM_FIELDS), permit_fields(model::Fields::IMAGE_FORM_FIELDS)])
  end
  
  def after_destroy r
    after_commit r
  end
  
  def save record
    params_ = permitted_params
    if params_[:parent_type].present?
      parent = SiteContent.create(type: permitted_params[:parent_type], site: params_.delete(:site))
    elsif params_[:parent_id].present?
      params_.delete(:site)
    end
    record.assign_attributes params_
    if record.type == 'text' && CompactCms.languages.present? && I18n.locale.in?(CompactCms.languages)
      record.language = I18n.locale
    end
    if record.type == 'text' && record.text.present?
      doc = Nokogiri::HTML(record.text)
      doc.css('p').find_all.each do |p|
        p.remove if p.content.blank?
      end
      record.text = doc.at('body').inner_html if doc.at('body').present?
    end
    record.parent = parent if parent.present?
    authorize record
    if record.save
      result = after_save record
      unless result.present? && result.key?(:redirect) && !result[:redirect]
        redirect_to action: :index
      end
    else
      form record
    end
  end
  
  def after_commit r
    redirect_to request.referrer
    { redirect: false }
  end
  
  def form record
    authorize record
    @site_content = record
    render :form, layout: false
  end
  
  def order_up
    change_order 1
  end
  
  def order_down
    change_order -1
  end
  
  def change_order change
    record = SiteContent.find params[:id]
    authorize record
    record.change_order change
    head :ok
  end
  
end
