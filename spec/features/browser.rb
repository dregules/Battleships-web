# require 'Capybara'  # => true

module Browser

  def in_browser name
    old_session = Capybara.session_name
    Capybara.session_name = name
    yield
  end
end


