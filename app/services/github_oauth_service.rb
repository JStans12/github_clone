class GithubOauthService

  def self.request_token(code)
    response =
    Faraday.post("https://github.com/login/oauth/access_token?client_id=#{ENV['github_client_id']}&client_secret=#{ENV['github_client_secret']}&code=#{code}")
    response.body.split(/\W+/)[1]
  end

  def self.request_user(token)
    oauth_response = Faraday.get("https://api.github.com/user?access_token=#{token}")
    JSON.parse(oauth_response.body)
  end
end
