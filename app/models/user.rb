class User < ActiveRecord::Base
	belongs_to :company
	has_many :works
	has_many :projects, through: :works
end
