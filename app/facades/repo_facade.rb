class RepoFacade
  def self.get_repos(type, user)
    repos = RepoService.repos(type, user)
    repos.map { |repo| Repo.new(repo) }
  end
end
