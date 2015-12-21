class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable,
         :encryptable, :encryptor => :md5

  has_many :products, dependent: :destroy
  has_one :profile, dependent: :destroy
end
