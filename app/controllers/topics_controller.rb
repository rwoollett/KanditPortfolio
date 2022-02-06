class TopicsController < ApplicationController
  layout 'blog'

  def show
    @topics = Topic.all
    @topic = Topic.find(params[:id])
    @featured = @topic.blogs.published.limit(2)
    @feature = Blog.first

    if logged_in?(:site_admin)
      @blogs = @topic.blogs.recent.page(params[:page]).per(5)
    else
      @blogs = @topic.blogs.published.recent.page(params[:page]).per(5)
    end

  end
end
