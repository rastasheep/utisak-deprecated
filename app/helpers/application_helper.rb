module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, { :sort => column, :direction => direction }, { :class => css_class }
  end

  def render_time(time)
    if time.present?
      l(time, :format => :widget)
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

  def avatar_url(author_email, options = {})
    gravatar_id = Digest::MD5.hexdigest(author_email.downcase)
    size = options[:size].present? ? options[:size] : "48"
    "https://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=mm"
  end

  def action_link(action='')
    if action == "new"
      link_to new_news_path, :class => "header-button header-button-icon header-button-right" do
        '<button><i class="icon-add">New</i></button>'.html_safe
      end
    else
      link_to news_index_path, :class => "header-button header-button-icon header-button-right" do
        '<button><i class="icon-home">Home</i></button>'.html_safe
      end
    end
  end

  def nice_format(content)
   auto_link(simple_format(content), :html => { :target => "_blank" })
  end

  def bookmarklet_url
    'javascript:window.location="http://www.utisak.com/new?url="+encodeURIComponent(document.location)+"&title="+encodeURIComponent(document.title)'
  end

end
