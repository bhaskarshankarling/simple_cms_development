class Section < ActiveRecord::Base

	belongs_to :page
	has_many :section_edits
	has_many :editors, :through => :section_edits, :class_name => "AdminUser"

	acts_as_list :scope => :page

	after_save :touch_page

	CONTENT_TYPE = ['text','HTML']
	validates :name, :presence => true,
	  				 :length => { :maximum => 255 }
	validates :content_type, :inclusion => {:in => CONTENT_TYPE, :message => "Content type should have either of #{CONTENT_TYPE.join(', ')}" }
	validates :content, :presence => true

	scope :sorted, lambda{ order("sections.position ASC")}

	private

	def touch_page
		page.touch
	end
end
