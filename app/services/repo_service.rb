class RepoService
  def self.repos(type, user)
    response = conn(user).get("/user/repos?type=#{type}")
    data = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn(user)
    Faraday.new(
      url: 'https://api.github.com',
      headers: {
        'Authorization': "token #{user.token}"
      }
    )
  end
end
