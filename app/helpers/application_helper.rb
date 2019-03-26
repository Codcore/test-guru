module ApplicationHelper
  BOOTSTRAP_CLASSES_FOR_FLASH = { 'success' => 'alert-success',
                                  'error' => 'alert-danger',
                                  'alert' => 'alert-warning',
                                  'notice' => 'alert-info' }.freeze
  def year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author.downcase}/#{repo.downcase}/"
  end

  def flash_message(message)
    content_tag :p, flash[message], class: 'flash alert' if flash[message]
  end

  def bootstrap_class_for_flash(flash_type)
    BOOTSTRAP_CLASSES_FOR_FLASH[flash_type]
  end
end
