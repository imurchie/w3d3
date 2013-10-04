class User < ActiveRecord::Base
   attr_accessible :email

   validates :email, :presence => true, :uniqueness => true

   has_many :submitted_urls,
            :class_name => "ShortenedUrl",
            :primary_key => :id,
            :foreign_key => :submitter_id

   has_many :visits,
            :class_name => "Visit",
            :primary_key => :id,
            :foreign_key => :visitor_id

   has_many :visited_urls, :through => :visits, :source => :visited_url
end
