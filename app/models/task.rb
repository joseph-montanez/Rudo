class Task < ActiveRecord::Base
  acts_as_tree :order => 'priority DESC', :dependent => :destroy, :with_advisory_lock => false
  belongs_to :user
  has_many :photos, :through => :attachments

  validates :name, presence: true
  validates :parent_id, presence: {
    message: 'cannot be blank unless a user is selected'
    }, :unless => :user_id? 
  validates :user_id, presence: {
    message: 'cannot be blank unless a parent is selected'
    }, :unless => :parent_id?

  after_save :store_photo

  #attr_accessor :priority_level
  # def photo=(file_data)
  #   unless file_data.blank?
  #     @file_data = file_data
  #     self.extension = file_data.original_filename.split('.').last.downcase
  #   end
  # end

  def priority_level
    if !self.priority.nil?
      if self.priority > 6
        'High'
      elsif self.priority > 3
        'Medium'
      elsif self.priority > -1
        'Low'
      else
        'Unknown'
      end
    else
      'Not Set'
    end
  end

  def priority_level_short
    if !self.priority.nil?
      if self.priority > 6
        '!!'
      elsif self.priority > 3
        '!'
      elsif self.priority > -1
        ''
      else
        ''
      end
    else
      ''
    end
  end

  def priority_name
    self.priority_level_short + self.name
  end
  
  # def priority_level_attribute=(value)
  #   raise "You can't set this attribute. It is read-only"
  # end

	def self.create_task_by_user(user, fields)
    task = nil
    if fields[:parent_id].present?
      ## If there is a user then prefernce the parent
      parent = nil
      if !user.nil?
        parent = user.tasks.find_by(id: fields[:parent_id])
      end

      ## If there is a parent then associate to parent
      if !parent.nil?
        task = parent.children.build(fields)
      end
    else
      if !user.nil?
        task = user.tasks.build(fields)
      end
    end

    if task.nil?
      task = Task.create(fields)
    end

    if !user.nil?
      task.user = user
    end

    task
  end

  def self.flatten_nested_hash(tasks)
    tasks.flat_map{|k, v| [k, *Task.flatten_nested_hash(v)]}
  end

  def self.flat_tree(space=true)
    tasks = Task.flatten_nested_hash(Task.hash_tree)
    if space
      tasks.each { |leaf| leaf.name = ('--' * leaf.depth) + ' ' + leaf.name; }
    end
    tasks
  end

  # private
  #   PHOTO_STORE = File.join Rails.root, 'public', 'photo_store'

  #   def store_photo
  #     if @file_data    
  #       FileUtils.mkdir_p PHOTO_STORE
  #       File.open(photo_filename, 'wb') do |f|
  #         f.write(@file_data.read)
  #       end    
  #       @file_data = nil
  #     end
  #   end
    
  #   def photo_filename
  #     File.join PHOTO_STORE, "#{id}.#{extension}"
  #   end
    
  #   def photo_path
  #     "/photo_store/#{id}.#{extension}"
  #   end
end
