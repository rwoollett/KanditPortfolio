module NavTopic 
  extend ActiveSupport::Concern

  included do 
    before_action :set_nav_topics, except: %i[ create update destroy toggle_status ]
  end
  
  def set_nav_topics
    @featured = Blog.published.limit(2)
    @feature = Blog.published.first
    @nav_topics = Topic.with_blogs.order("topics.title")
  end

end
