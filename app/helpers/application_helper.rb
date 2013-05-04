module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, { :sort => column, :direction => direction }, { :class => css_class }
  end

  def render_time(time)
    if time.present?
      l(time, :format => :short)
    else
      "-"
    end
  end

  def render_title
    return @full_page_title if @full_page_title.present?

    @admin_page = true if params[:controller].include?("admin")

    if @admin_page
      if @page_title
        [@page_title, "Admin - Utisak"].join(" - ")
      else
        "Admin - Utisak"
      end
    elsif @page_title
      [@page_title, "Utisak"].join(" - ")
    else
      "Utisak"
    end
  end

  # Initializes page title as "title - Utisak".
  # If you pass the :false option, only +title+ will be in the meta tag.

  def page_title(title, options = {})
    if options[:full]
      @full_page_title = title
    else
      @page_title = title
    end
  end

end
