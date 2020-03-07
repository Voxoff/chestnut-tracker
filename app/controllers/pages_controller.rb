class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @date = DateTime.now.strftime("%C %B %Y")
  end
end
