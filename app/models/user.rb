class User < ActiveRecord::Base
	belongs_to :company
	has_many :works
	has_many :projects, through: :works

	validates :fname, length: {minimum: 2}
	validates :lname, length: {minimum: 5}
	validates :company, presence: true
end
