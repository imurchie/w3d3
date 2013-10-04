class Visit < ActiveRecord::Base
#   attr_accessible

  belongs_to :visitor,
             :class_name => "User",
             :primary_key => :id,
             :foreign_key => :visitor_id


  belongs_to :visited_url,
             :class_name => "ShortenedUrl",
             :primary_key => :id,
             :foreign_key => :visited_url_id

  def self.record_visit!(user, shortened_url)
    new_visit = Visit.new
    new_visit.visitor_id = user.id
    new_visit.visited_url_id = shortened_url.id
    new_visit.save!
    new_visit
  end

end
