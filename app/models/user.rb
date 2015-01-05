class User < ActiveRecord::Base

	# Adds `can_create?(resource)`, etc
  include Authority::UserAbilities
  
  rolify :before_add => :before_add_method

  def before_add_method(role)
    # do something before it gets added
  end

  # To update a specific resource instance, you must either own it or be an admin
  def updatable_by?(user)
    resource.author == user || user.has_role?(:admin)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
