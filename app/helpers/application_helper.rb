module ApplicationHelper
  include Pagy::Frontend
  
  def gravatar_for(user, class_names=nil, options = { size: 500 })
    return "" if user.nil?
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: class_names)
  end

  def active_class(controllers_name={}, class_name)
    # logger.info("========== controller name #{controller_name}")
    # logger.info("========== controller name include? #{controllers_name.include?(controller_name)}")
    controllers_name.include?(controller_name) ? class_name : ''
  end

  def errors_messages_for(object)
    if object.errors.any?
      content_tag(:div, class: "card border-danger mb-3") do
        concat(content_tag(:div, class: "card-header bg-danger text-white") do
          concat "#{pluralize(object.errors.count, "error")} prohibited this #{object.class.name.downcase} from being saved:"
        end)
        concat(content_tag(:ul, class: 'mb-0 list-group list-group-flush') do
          object.errors.full_messages.each do |msg|
            concat content_tag(:li, msg, class: 'list-group-item')
          end
        end)
      end
    end
  end

  def time_diff(start_time, end_time)
    seconds_diff = (start_time - end_time).to_i.abs

    hours = seconds_diff / 3600
    seconds_diff -= hours * 3600

    minutes = seconds_diff / 60
    seconds_diff -= minutes * 60

    seconds = seconds_diff

    "#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
  end

  def order_status(status)
    case status
    when 'pending'
      html = <<-HTML
      <span class="badge badge-danger">#{status.upcase}</span>
      HTML
    when 'done'
      html = <<-HTML
      <span class="badge badge-info">#{status.upcase}</span>
      HTML
    when 'delivered'
      html = <<-HTML
      <span class="badge badge-success">#{status.upcase}</span>
      HTML
    when 'processing'
      html = <<-HTML
      <span class="badge badge-warning">#{status.upcase}</span>
      HTML
    else 
      html = <<-HTML
      <span class="badge badge-danger">#{status.upcase}</span>
      HTML
    end
    return html.html_safe
    
  end

  def background_object
    Background.first
  end
  
end
