class Page < ActiveRecord::Base

	belongs_to :subject
	has_many :sections
	has_and_belongs_to_many :editors, :class_name => "AdminUser"

	acts_as_list :scope => :subject

	before_validation :add_default_permalink
	after_save :touch_subject

	validates :name, :presence => true,
		 			 :length => { :maximum => 255 }
	validates :permalink, :presence => true,
	 		  			  :length => { :within => 3..255 },
						  :uniqueness => true


	scope :sorted, lambda{ order("pages.position ASC") }

	private

	def add_default_permalink
		if permalink.blank?
			self.permalink = "#{id}-#{name.parameterize}"
		end
	end

	def touch_subject
		subject.touch
	end
end
