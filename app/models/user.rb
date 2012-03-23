class User < ActiveRecord::Base
  has_attached_file :icon, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
