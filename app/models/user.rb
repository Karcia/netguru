class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :firstname, :uniqueness => true
  validates_presence_of :lastname, :uniqueness => true

  has_many :reviews
  has_many :products

  def admin?
  	admin == true
  end

end
