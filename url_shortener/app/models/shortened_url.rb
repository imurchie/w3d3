require "securerandom"

class ShortenedUrl < ActiveRecord::Base
  attr_accessible :short_url, :long_url

  validates :submitter_id, :presence => true
  validates :long_url, :presence => true, :length => { maximum: 255 }
  validates :short_url, :presence => true, :uniqueness => true
  validate :no_serial_submitters

  belongs_to :submitter,
             :class_name => "User",
             :primary_key => :id,
             :foreign_key => :submitter_id

  has_many :visits,
           :class_name => "Visit",
           :primary_key => :id,
           :foreign_key => :visited_url_id

  has_many :visitors, :through => :visits, :source => :visitor, :uniq => true

  has_many :taggings,
           :class_name => "Tagging",
           :primary_key => :id,
           :foreign_key => :tagged_url_id

  has_many :tag_topics, :through => :taggings, :source => :tag_topic


  def self.random_code
    while true
      short_url = SecureRandom.urlsafe_base64

      return short_url if ShortenedUrl.where("short_url = ?", short_url).empty?
    end
  end

  def self.create_for_user_and_long_url!(user, long_url)
    short_url = ShortenedUrl.random_code
    user.submitted_urls.create!(:long_url => long_url, :short_url => short_url)
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visitors.count(:distinct => true)
  end

  def num_recent_uniques
    visitors.count(:distinct => true, :conditions => "visits.created_at >= '#{10.minutes.ago}'" )
  end


  private

  def no_serial_submitters
    count = ShortenedUrl.count(:conditions => "submitter_id = '#{submitter.id}' AND created_at >= '#{1.minute.ago}'" )
    if count > 4
      errors[:base] << "Too many URLs (#{count}) submitted by #{submitter.email}"
    end
  end
end
