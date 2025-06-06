class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @feedbacks = Feedback.where("rating > 4").limit(3)
    @projects = Project.order(created_at: :desc).limit(3)
  end
end
