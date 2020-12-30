module ApplicationHelper
  def assets_url(path)
    'https://sharehouse-app-assets.s3-ap-northeast-1.amazonaws.com/' + path
  end

  def user_image_url(user)
    if user.present?
      if user.profile_image.attached?
        assets_url(user.profile_image.blob.key)
      else
        assets_url('nouser.jpg')
      end
    else
      assets_url('nouser.jpg')
    end
  end

  def room_image_url(room)
    if room.present?
      if room.image.attached?
        assets_url(room.image.blob.key)
      else
        assets_url('nouser.jpg')
      end
    else
      assets_url('nouser.jpg')
    end
  end

end
