class Project < ActiveRecord::Base
	belongs_to :company
	has_many :works
	has_many :users, through: :works
	belongs_to :user

	validates :name, length: {minimum: 5}
	validates :company_id, presence: true
	validates :default_rate, numericality: { only_integer: true,
											  greater_than: 50,
											  less_than: 1000}
	validates :slug, length: {minimum: 3}
	validates :slug, uniqueness: true											 

	scope :lowdefaultrate,->{where("default_rate<?",100)}

	def to_s
		"#{name} (#{company})"
	end
end
