module UsersHelper
  def gravatar_for user, class_name
    gravatar_id = Digest::MD5::hexdigest current_user.email.downcase
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag gravatar_url, alt: current_user.name, class: class_name
  end
end
