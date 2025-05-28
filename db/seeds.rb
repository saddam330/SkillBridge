# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# Clear existing data
Message.delete_all
Feedback.delete_all
Application.delete_all
Project.delete_all
User.delete_all

# Create Users
users = 10.times.map do
  User.create!(
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(min_length: 10),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    employee: [true, false].sample,
    skills: [
      "Ruby on Rails",
      "JavaScript",
      "React",
      "PostgreSQL",
      "AWS"
    ].sample(rand(2..5)).join(", "),
  )
end

# Create Projects
projects = 10.times.map do
  Project.create!(
    project_title: Faker::App.name,
    project_description: Faker::Lorem.paragraph(sentence_count: 3),
    job_title: Faker::Job.title,
    job_description: Faker::Job.field,
    duration: "#{rand(1..12)} months",
    requirements: [
      "Ruby on Rails",
      "JavaScript",
      "React",
      "PostgreSQL",
      "AWS"
    ].sample(rand(2..5)).join(", "),
    category: Faker::Job.field,
    closing_date: Faker::Date.forward(days: 30),
    start_date: Faker::Date.forward(days: 60),
    location: Faker::Address.city,
    company_name: Faker::Company.name,
    company_details: "#{Faker::Company.catch_phrase}. We are a #{Faker::Company.industry} company founded in #{rand(2000..2022)}. #{Faker::Company.bs.capitalize}. Our team of #{rand(10..500)} employees is dedicated to #{Faker::Company.bs.capitalize}.",
    perks: [
      "Flexible working hours",
      "Remote work options",
      "Professional development budget",
      "Health insurance",
      "Gym membership"
    ].sample(rand(4..5)).join(", "),
    learning_outcomes: [
      "Gain experience with agile development methodologies",
      "Improve full-stack development skills",
      "Learn cloud deployment best practices",
      "Build expertise in test-driven development",
      "Develop skills in microservice architecture"
    ].sample(rand(4..5)).join(", "),

    user: users.sample
  )
end

# Create Applications
applications = 20.times.map do
  Application.create!(
    status: %w[pending accepted rejected].sample,
    user: users.sample,
    project: projects.sample
  )
end

# Create Feedbacks
applications.each do |application|
  if [true, false].sample
    Feedback.create!(
      comment: Faker::Lorem.sentence(word_count: 10),
      rating: rand(1.0..5.0).round(1),
      application: application
    )
  end
end

# Create Messages
applications.each do |application|
  rand(1..3).times do
    Message.create!(
      content: Faker::Lorem.sentence(word_count: 8),
      user: users.sample,
      application: application
    )
  end
end

puts "Seeded #{User.count} users, #{Project.count} projects, #{Application.count} applications, #{Feedback.count} feedbacks, #{Message.count} messages."
