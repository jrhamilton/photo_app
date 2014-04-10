class Photo < ActiveRecord::Base

  belongs_to :album
  has_many :tags
  has_many :users, through: :tags


has_attached_file :picture, :styles => { :medium => "300x300", :thumb => "100x100" }, :default_url => "/pictures/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

end
