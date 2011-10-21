class User
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  field :first_name, type: String
  field :last_name, type: String

  has_many :jobs

  validates_presence_of :first_name, :last_name

  def full_name
    [first_name, last_name].join(' ')
  end

end
