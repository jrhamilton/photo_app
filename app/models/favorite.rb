class Favorite < ActiveRecord::Base
  belongs_to :photo
  belongs_to :user


  def self.has_photo(params)
    self.where(params)
  end
end
