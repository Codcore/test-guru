module ApplicationHelper
  def year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author.downcase}/#{repo.downcase}/"
  end

  def flash_message(message)
    content_tag :p, flash[message], class: 'flash alert' if flash[message]
  end
end
