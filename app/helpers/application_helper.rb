module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  def show_embed_video(video_information, options={})
    width = options[:width] || 640
    height = options[:height] || 360
    frameborder = options[:frameborder] || 0
    if video_information.provider == "YouTube"
      %{<iframe width="#{width}" height="#{height}" src='//www.youtube.com/embed/#{video_information.video_id}' frameborder="#{frameborder}" allowfullscreen></iframe>}
    elsif video_information.provider == "Vimeo"
      %{<iframe src="http://player.vimeo.com/video/#{video_information.video_id}" width="#{width}" height="#{height}" frameborder="#{frameborder}" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>}
    end  
  end
end
