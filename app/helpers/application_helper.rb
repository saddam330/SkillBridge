module ApplicationHelper
  def status_class(status)
    case status
    when "pending" then "bg-warning text-dark"
    when "in process" then "bg-info text-white"
    when "accepted" then "bg-success text-white"
    when "rejected" then "bg-danger text-white"
    else "bg-secondary text-white"
    end
  end
end
