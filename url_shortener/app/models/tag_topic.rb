class TagTopic < ActiveRecord::Base
  attr_accessible :name

  has_many :taggings,
           :class_name => "Tagging",
           :primary_key => :id,
           :foreign_key => :tag_topic_id

  has_many :tagged_urls, :through => :taggings, :source => :tagged_url

  def self.most_popular_links_in_category(name)
    # can do direct SQL queries in Rails
    # e.g.,
    # User.find_by_sql(["SELECT * FROM users WHERE email = ?", "imurchie@gmail.com"])

    ShortenedUrl
      .select("shortened_urls.*, COUNT(*) AS visit_count")
      .joins(:tag_topics)
      .joins(:taggings)
      .joins(:visits)
      .group(:visited_url_id)
      .order("COUNT(*) DESC")
      .where("tag_topics.name = ?", name)
      .limit(10)
  end

end
