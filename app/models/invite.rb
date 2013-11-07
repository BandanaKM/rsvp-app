class Invite < ActiveRecord::Base
  belongs_to :guest, :class_name => "User", :foreign_key => :user_id
  belongs_to :event

	def guest_name
			self.guest.name if self.guest
	end

	def guest_name=(name)
		self.guest = User.find_or_create_by(:name => name)
	end 

end 
