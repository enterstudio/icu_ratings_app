class PagesController < ApplicationController
  def home
    @tournaments = Tournament.latest
    @news_items = NewsItem.latest
  end

  def contacts
    @contacts = User.contacts
  end

  def not_found
    render :file => "#{Rails.root}/public/404.html", :layout => false, :status => 404
  end
end