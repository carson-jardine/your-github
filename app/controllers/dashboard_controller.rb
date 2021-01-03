class DashboardController < ApplicationController
  def index
  end

  def show
    @public_repos = RepoFacade.get_repos('public', current_user)
    @private_repos = RepoFacade.get_repos('private', current_user)
  end
end
