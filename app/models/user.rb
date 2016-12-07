class User < ApplicationRecord

  def self.find_or_create_user(token, auth)
    user          = User.find_or_create_by(uid: auth["id"])
    user.username = auth["login"]
    user.uid      = auth["id"]
    user.token    = token
    user.save
    user
  end
end
