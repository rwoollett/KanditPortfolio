class Portfolio < ApplicationRecord

  validates_presence_of :title, :body, :thumb_image, :main_image

  def self.angular
    where(subtitle: "Angular")
  end

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on Rails")}

  after_initialize(:set_defaults)

  def set_defaults
    if self.main_image =~ /.*/
    end
    self.main_image ||= "http://placehold.it/600x400"
    self.thumb_image ||= "http://placehold.it/350x200"
  end
end
