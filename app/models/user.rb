class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :omniauthable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # before_save { self.email = email.downcase }

  has_many :messages

  has_many :tasks

  def as_json(options={})
    options[:except] ||= [:created_at, :updated_at]
    super(options)
  end
end
