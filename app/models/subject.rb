class Subject < ActiveRecord::Base

	has_many :pages

	acts_as_list

	validates :name, :presence => true,
	  				 :length => { :maximum => 255 }

	scope :visible, lambda{ where( :visible => true ) }
	scope :not_visible, lambda{ where( :visible => false ) }
	scope :sorted, lambda{ order("subjects.position ASC") }
	scope :newest_first, lambda{ order("subjects.created_at DESC") }
	scope :search, lambda{ |query|
		where["name LIKE ?", "%#{query}%"]
	}

end
