module ApplicationHelper
  def bootstrap_class_for_flash(flash_type)
    case flash_type
    when 'notice'
      'alert-success'
    when 'error'
      'alert-danger'
    else
      flash_type.to_s
    end
  end

  def show_header
    if current_page?(root_path)
      render :partial => 'layouts/search_content'
    else
    end
  end

  def show_location
    if current_page?(root_path)
      render :partial => 'layouts/location'
    else
    end
  end
end
