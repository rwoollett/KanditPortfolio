module NavTopic 
  extend ActiveSupport::Concern

  included do 
    before_action :set_nav_topics, except: %i[ create update destroy toggle_status ]
  end
  
  def set_nav_topics
    @featured = Blog.published.limit(2)
    @feature = Blog.published.last
    if logged_in?(:site_admin)
      @nav_topics = Topic.with_blogs.order("topics.title")
    else
      @nav_topics = Topic.with_published_blogs.order("topics.title")
    end
  end

end
