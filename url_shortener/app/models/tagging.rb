class Tagging < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :tag_topic,
             :class_name => "TagTopic",
             :primary_key => :id,
             :foreign_key => :tag_topic_id

  belongs_to :tagged_url,
             :class_name => "ShortenedUrl",
             :primary_key => :id,
             :foreign_key => :tagged_url_id


  def self.record_tagging!(tagged_url, tag_topic)
    new_tagging = Tagging.new
    new_tagging.tag_topic_id = tag_topic.id
    new_tagging.tagged_url_id = tagged_url.id
    new_tagging.save!
    new_tagging
  end
end
