crumb :root do
  link "Home", root_path
end

# company
crumb :company do |company|
  link company.alias, company_path(company)
  parent :root
end

# new company
crumb :new_company do
  link 'New company', new_company_path
  parent :root
end

# branch
crumb :branch do |company, branch|
  link branch.alias, company_branch_path(company, branch)
  parent :company, company
end

# new branch
crumb :new_branch do |company|
  link 'New branch', new_company_branch_path(company)
  parent :company, company
end

# analyte
crumb :analyte do |company, branch, analyte|
  link analyte.name, company_branch_analyte_path(company, branch, analyte)
  parent :branch, company, branch
end

# new analyte
crumb :new_analyte do |company, branch|
  link 'New analyte', new_company_branch_analyte_path(company, branch)
  parent :branch, company, branch
end

# new sampling
crumb :sampling do |company, branch, analyte, sampling|
  link sampling.name, new_company_branch_analyte_sampling_path(company, branch, analyte, sampling)
  parent :analyte, company, branch, analyte
end

# new sampling
crumb :new_sampling do |company, branch, analyte|
  link 'New sampling', new_company_branch_analyte_sampling_path(company, branch, analyte)
  parent :analyte, company, branch, analyte
end

# specie profile
crumb :specie_profiles do
  link 'Specie profiles', specie_profiles_path
  parent :root
end

# specific specie profile
crumb :specie_profile do |specie_profile|
  link specie_profile.especiename, specie_profile_path(specie_profile)
  parent :specie_profiles
end

# new specie profile
crumb :new_specie_profile do
  link 'New specie profile', new_specie_profile_path
  parent :specie_profiles
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
