module UsersHelper
  def user_avatar(user, options={})
    size = options[:size] || 60
    link_to image_tag(user.gravatar_url(:size => size), :title => user.username, :height => size, :width => size), user
  end
end
