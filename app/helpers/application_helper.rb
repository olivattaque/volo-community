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
  
  def show_embed_video(video_information)
    if video_information.provider == "YouTube"
      %{<iframe width=400 height=250 src='//www.youtube.com/embed/#{video_information.video_id}' frameborder=0 allowfullscreen></iframe>}
    elsif video_information.provider == "Vimeo"
      %{<iframe src="http://player.vimeo.com/video/#{video_information.video_id}=0&amp;byline=0&amp;portrait=0&amp;autoplay=0" frameborder="0"></iframe>}
    end  
  end
  
  def say_hello(text)
    "#{text}"
  end
end
