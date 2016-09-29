class ProjectsController < ApplicationController
	before_filter :authenticate_user!
	
	def index
		@projects=Project.all
		respond_to do |format|
			format.html
			format.csv {send_data Project.export_csv(@projects), type: 'text/csv; charset=utf-8; header=present', disposition:'attachment; filename=contacts.csv'}
		end
	end

	def show
		if (params[:slug])
			@project=Project.find_by slug: params[:slug]
		else
			@project=Project.find(params[:id])
		end
		@work=Work.new
		@work.project=@project
	end

	def new
		@project=Project.new
	end

	def create
		@project=Project.new(params[:project].permit(:name, :slug, :company_id, :default_rate, :user_id))
		if  @project.save
			flash[:notice]='Project Created'
			redirect_to @project
		else
			render 'new'
		end
	end

	def edit
		@project=Project.find(params[:id])
	end

	def update
		@project=Project.find(params[:id])
		if @project.update(params[:project].permit(:name, :slug, :company_id, :default_rate, :user_id))
			Usermailer.projectupdated_email(@project).deliver
			flash[:notice]='Project Updated'
			redirect_to @project
		else
			render 'edit'
		end
	end
end
