class User < ActiveRecord::Base
  has_many :albums
  has_many :photos, through: :albums
  has_many :photos, through: :tags

  has_secure_password

  has_attached_file :avatar, :styles => { :medium => "300x300", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates_uniqueness_of :email
end
