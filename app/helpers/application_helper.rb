module ApplicationHelper
  def year
    Time.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author.downcase}/#{repo.downcase}/"
  end
end
