class HomeController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def login
    redirect_to new_user_session_path
  end
end
