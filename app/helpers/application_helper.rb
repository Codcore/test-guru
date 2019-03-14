module ApplicationHelper
  def year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author.downcase}/#{repo.downcase}/"
  end
end
