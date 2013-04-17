# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  lat             :float
#  lng             :float
#  address         :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :lat, :lng, :address
  has_secure_password
  validates :email, :presence=>true, :uniqueness=>true
  has_many :tours
  has_many :orders

  def name
    "#{self.first_name} #{self.last_name}"
  end

end
