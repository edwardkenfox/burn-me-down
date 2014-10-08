class RootController < ApplicationController
  def test
    render file: Rails.root.join('public', 'test.php.html')
  end
end
