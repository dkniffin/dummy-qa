# TODO: Fill in URL slug for admin - example: /admin
# TODO: Fill in the URL slug for user - example: /

module NavigationHelper
  def get_log_in_url(type)
    urls = {
      admin: "",
      user: ""
    }

    urls[type]
  end

  def go_to_url_and_verify(url)
    visit(url)
    expect(page.current_url).to match(Regexp.escape(url))
  end
end
