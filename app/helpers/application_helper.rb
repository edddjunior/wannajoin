module ApplicationHelper

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
