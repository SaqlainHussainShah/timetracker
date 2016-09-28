module ApplicationHelper

	def nav_items
		[
			{
			displaytext: 'Companies',
			controllername: 'companies',
			linkurl: companies_path
			},
			{
			displaytext: 'Projects',
			controllername: 'projects',
			linkurl: projects_path
			},
			{
			displaytext: 'Works',
			controllername: 'works',
			linkurl: works_path
			}
		]
	end

	def display_nav_item(displaytext,controllername,linkurl)
		raw("<li#{controller_name==controllername ? 'class="active"': ''}>#{link_to displaytext, linkurl}</li>")		
	end
	
end
