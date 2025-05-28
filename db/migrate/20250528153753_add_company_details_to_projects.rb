class AddCompanyDetailsToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :company_details, :text
  end
end
