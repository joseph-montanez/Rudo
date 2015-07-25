class Photo < ActiveRecord::Base
	dragonfly_accessor :image
	 has_many :tasks, through: :attachments
end
