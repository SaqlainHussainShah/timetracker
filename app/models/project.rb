class Project < ActiveRecord::Base

	belongs_to :company
	has_many :works
	has_many :users, through: :works
	belongs_to :owner, class_name: "User"

	validates :name, length: {minimum: 5}
	validates :company_id, presence: true
	validates :owner_id, presence: true
	validates :default_rate, numericality: { only_integer: true,
											  greater_than: 50,
											  less_than: 1000}
	validates :slug, length: {minimum: 3}
	validates :slug, uniqueness: true											 

	scope :lowdefaultrate,->{where("default_rate<?",100)}

	def to_s
		"#{name} (#{company})"
	end

	def self.export_csv(projects)
		CSV.generate() do |csv|
			csv << ['name','company','default_rate','created_at','owner','most recent work item']
			projects.each do |project|
					csv<< [
						project.name,
						project.company,
						project.default_rate,
						project.created_at,
						project.user,
						project.works.order('created_at DESC').first
					]
			end
		end
	end
end
