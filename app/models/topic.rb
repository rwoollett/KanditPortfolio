class Topic < ApplicationRecord
  validates_presence_of :title

  has_many :blogs

  def self.with_blogs
    includes(:blogs).where.not(blogs: { id: nil })
  end

  def self.with_published_blogs
    with_blogs.where(blogs: { status: 1})
  end
  #.or(includes(:blogs).where(blogs: { status: 1}))
end
