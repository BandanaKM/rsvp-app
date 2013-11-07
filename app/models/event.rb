class Event < ActiveRecord::Base
	belongs_to :host, :class_name => "User"
	has_many :invites

	has_many :guest, :through => :invites, :class_name => "User"
end
