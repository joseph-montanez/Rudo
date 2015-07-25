class Attachment < ActiveRecord::Base
  belongs_to :task
  belongs_to :photo
end
