class Company < ActiveRecord::Base
	has_many :users
	has_many :projects

	validates :name, length:{minimum: 5}

	def to_s
		name
	end
end
