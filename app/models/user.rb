class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :records
  has_many :products

  validates_presence_of :name
  validates_presence_of :last_name

  def admin?
    self.role.name == "Admin"
  end

  def manufacturer?
    self.role.name == "Tier 2 Manufacturers"
  end

  def distributor?
    self.role.name == "Distributor"
  end

  def full_name
  	name + " " + last_name
  end

end
