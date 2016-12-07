module ApplicationHelper
  def github_login
    "https://github.com/login/oauth/authorize?client_id=#{ENV['github_client_id']}&scope=user"
  end
end
