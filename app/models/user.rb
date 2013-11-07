class User < ActiveRecord::Base
	has_many :hosted_events, :foreign_key => "host_id", :class_name => "Event"
	has_many :invites, :foreign_key => "guest_id"

	has_many :invited_events, :through => :invites, :class_name => "Event"
end
