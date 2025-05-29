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
users = User.create!([
  { first_name: "Alice", last_name: "Johnson", email: "alice@example.com", password: "password", employer: true, skills: "Leadership, Project Management" },
  { first_name: "Bob", last_name: "Smith", email: "bob@example.com", password: "password", employer: false, skills: "Ruby, JavaScript, React" },
  { first_name: "Carla", last_name: "Nguyen", email: "carla@example.com", password: "password", employer: true, skills: "Marketing, SEO" },
  { first_name: "David", last_name: "Lee", email: "david@example.com", password: "password", employer: false, skills: "Python, Machine Learning" },
  { first_name: "Emma", last_name: "Williams", email: "emma@example.com", password: "password", employer: false, skills: "UI/UX, Figma" },
  { first_name: "Frank", last_name: "Garcia", email: "frank@example.com", password: "password", employer: true, skills: "Sales, Business Development" },
  { first_name: "Grace", last_name: "Kim", email: "grace@example.com", password: "password", employer: false, skills: "Product Design, Illustration" },
  { first_name: "Henry", last_name: "Miller", email: "henry@example.com", password: "password", employer: false, skills: "DevOps, AWS" },
  { first_name: "Isabella", last_name: "Lopez", email: "isabella@example.com", password: "password", employer: true, skills: "Finance, Strategy" },
  { first_name: "Jack", last_name: "Brown", email: "jack@example.com", password: "password", employer: false, skills: "Mobile Dev, Swift" },
  { first_name: "Kathy", last_name: "Chen", email: "kathy@example.com", password: "password", employer: true, skills: "HR, Recruiting" },
  { first_name: "Leo", last_name: "Davis", email: "leo@example.com", password: "password", employer: false, skills: "Game Dev, Unity" },
  { first_name: "Mia", last_name: "Patel", email: "mia@example.com", password: "password", employer: false, skills: "Data Analysis, Excel" },
  { first_name: "Nathan", last_name: "White", email: "nathan@example.com", password: "password", employer: true, skills: "Software Architecture" },
  { first_name: "Olivia", last_name: "Scott", email: "olivia@example.com", password: "password", employer: false, skills: "Content Writing, Social Media" },
  { first_name: "Paul", last_name: "Taylor", email: "paul@example.com", password: "password", employer: false, skills: "Cybersecurity" },
  { first_name: "Quinn", last_name: "Evans", email: "quinn@example.com", password: "password", employer: true, skills: "Logistics, Operations" },
  { first_name: "Rachel", last_name: "Moore", email: "rachel@example.com", password: "password", employer: false, skills: "Video Editing" },
  { first_name: "Sam", last_name: "Anderson", email: "sam@example.com", password: "password", employer: true, skills: "Legal, Compliance" },
  { first_name: "Tina", last_name: "Martin", email: "tina@example.com", password: "password", employer: false, skills: "Illustration, Animation" }
])
# Create Projects
projects = Project.create!([
  {
    project_title: "Website Redesign",
    project_description: "Modernize the UI for a marketing website.",
    job_title: "Frontend Developer",
    job_description: "Work with React and Tailwind.",
    duration: "3 months",
    requirements: "React, Tailwind CSS",
    category: "Web Development",
    closing_date: Date.today + 30,
    start_date: Date.today + 45,
    location: "Remote",
    user_id: users[0].id,
    company_name: "TechNova Inc.",
    perks: "Flexible hours, remote work",
    learning_outcomes: "Gain real-world frontend experience",
    company_details: "Innovative startup building digital tools."
  },
  {
    project_title: "SEO Optimization Campaign",
    project_description: "Boost rankings for client websites.",
    job_title: "SEO Specialist",
    job_description: "Conduct audits, keyword research.",
    duration: "6 weeks",
    requirements: "SEO tools experience",
    category: "Marketing",
    closing_date: Date.today + 20,
    start_date: Date.today + 30,
    location: "New York, NY",
    user_id: users[2].id,
    company_name: "MarketWiz",
    perks: "Office snacks, mentorship",
    learning_outcomes: "Learn performance-based marketing",
    company_details: "A fast-growing digital marketing firm."
  },
  {
    project_title: "AI Chatbot for Customer Service",
    project_description: "Build a chatbot for answering FAQs.",
    job_title: "AI Developer",
    job_description: "Use NLP models to train a chatbot.",
    duration: "4 months",
    requirements: "Python, NLP, TensorFlow",
    category: "Artificial Intelligence",
    closing_date: Date.today + 25,
    start_date: Date.today + 35,
    location: "San Francisco, CA",
    user_id: users[4].id,
    company_name: "SupportAI",
    perks: "Tech allowance",
    learning_outcomes: "Hands-on NLP and ML development",
    company_details: "Pioneering automation in support tech."
  },
  {
    project_title: "E-Commerce Platform Development",
    project_description: "Develop a scalable e-commerce platform with user-friendly interfaces and secure payment integration.",
    job_title: "Full Stack Developer",
    job_description: "Design and implement frontend and backend systems for the e-commerce platform.",
    duration: "6 months",
    requirements: "React, Node.js, MongoDB, Stripe API",
    category: "Web Development",
    closing_date: Date.today + 40,
    start_date: Date.today + 50,
    location: "London, UK",
    user_id: users[6].id,
    company_name: "ShopEase Ltd.",
    perks: "Health insurance, remote work options",
    learning_outcomes: "Experience in building full-stack applications and integrating third-party services.",
    company_details: "A startup aiming to revolutionize online shopping experiences."
  },
  {
    project_title: "AI-Powered Music Recommendation System",
    project_description: "Develop an AI system that suggests songs based on users’ listening habits and preferences.",
    job_title: "Machine Learning Engineer",
    job_description: "Implement collaborative filtering algorithms and integrate with music streaming APIs.",
    duration: "4 months",
    requirements: "Python, TensorFlow, Spotify API",
    category: "Artificial Intelligence",
    closing_date: Date.today + 35,
    start_date: Date.today + 45,
    location: "Berlin, Germany",
    user_id: users[8].id,
    company_name: "TuneMatch",
    perks: "Music subscription, flexible hours",
    learning_outcomes: "Hands-on experience with recommendation systems and user data analysis.",
    company_details: "A tech company focused on enhancing music discovery through AI."
  },
  {
    project_title: "Personal Finance Tracker App",
    project_description: "Create a web application that helps users manage their personal finances by tracking income, expenses, and savings.",
    job_title: "Backend Developer",
    job_description: "Develop APIs and manage database systems for financial data.",
    duration: "3 months",
    requirements: "Django, PostgreSQL, REST APIs",
    category: "Web Development",
    closing_date: Date.today + 25,
    start_date: Date.today + 35,
    location: "Remote",
    user_id: users[10].id,
    company_name: "FinanceBuddy",
    perks: "Stock options, remote work",
    learning_outcomes: "Experience in financial data handling and backend development.",
    company_details: "A fintech startup aiming to simplify personal finance management."
  },
  {
    project_title: "AI-Based Disaster Management System",
    project_description: "Develop an AI system to predict, analyze, and respond to natural disasters using real-time data.",
    job_title: "Data Scientist",
    job_description: "Analyze satellite and sensor data to improve disaster response strategies.",
    duration: "5 months",
    requirements: "Python, Machine Learning, GIS",
    category: "Artificial Intelligence",
    closing_date: Date.today + 30,
    start_date: Date.today + 40,
    location: "Tokyo, Japan",
    user_id: users[12].id,
    company_name: "SafeEarth",
    perks: "Travel allowances, research opportunities",
    learning_outcomes: "Application of AI in environmental science and disaster management.",
    company_details: "An organization dedicated to leveraging technology for disaster preparedness."
  },
  {
    project_title: "Online Auction Platform",
    project_description: "Develop a platform where users can buy and sell products through auctions with real-time bidding features.",
    job_title: "Frontend Developer",
    job_description: "Design and implement user interfaces for auction listings and bidding processes.",
    duration: "4 months",
    requirements: "Vue.js, WebSockets, Firebase",
    category: "Web Development",
    closing_date: Date.today + 28,
    start_date: Date.today + 38,
    location: "Sydney, Australia",
    user_id: users[14].id,
    company_name: "BidNow",
    perks: "Flexible schedule, team outings",
    learning_outcomes: "Experience in real-time web applications and user engagement strategies.",
    company_details: "An e-commerce company specializing in online auctions."
  },
  {
    project_title: "AI-Powered Virtual Fashion Assistant",
    project_description: "Create a virtual assistant that uses computer vision and AI to offer outfit recommendations based on user preferences.",
    job_title: "Computer Vision Engineer",
    job_description: "Develop algorithms to analyze clothing items and suggest fashion combinations.",
    duration: "6 months",
    requirements: "Python, OpenCV, Deep Learning",
    category: "Artificial Intelligence",
    closing_date: Date.today + 45,
    start_date: Date.today + 55,
    location: "Paris, France",
    user_id: users[16].id,
    company_name: "StyleGenie",
    perks: "Fashion discounts, creative workshops",
    learning_outcomes: "Application of AI in the fashion industry and user personalization.",
    company_details: "A fashion tech company aiming to personalize shopping experiences."
  },
  {
    project_title: "Volunteer Management System",
    project_description: "Create a platform for organizing volunteer work, allowing nonprofits to post opportunities and users to sign up.",
    job_title: "Full Stack Developer",
    job_description: "Develop both frontend and backend systems for managing volunteer events.",
    duration: "3 months",
    requirements: "Ruby on Rails, React, PostgreSQL",
    category: "Web Development",
    closing_date: Date.today + 20,
    start_date: Date.today + 30,
    location: "Toronto, Canada",
    user_id: users[18].id,
    company_name: "HelpHub",
    perks: "Community engagement, flexible hours",
    learning_outcomes: "Experience in building platforms for social good and event management.",
    company_details: "A nonprofit organization connecting volunteers with community service opportunities."
  },
  {
    project_title: "AI-Based Real-Time Fire Detection System",
    project_description: "Develop a real-time fire detection system using AI and computer vision to enhance safety measures.",
    job_title: "AI Engineer",
    job_description: "Implement algorithms to detect fire hazards in video feeds and alert relevant authorities.",
    duration: "4 months",
    requirements: "TensorFlow, OpenCV, Python",
    category: "Artificial Intelligence",
    closing_date: Date.today + 35,
    start_date: Date.today + 45,
    location: "Dubai, UAE",
    user_id: users[1].id,
    company_name: "SafeHome Tech",
    perks: "Housing allowance, health benefits",
    learning_outcomes: "Application of AI in safety and surveillance systems.",
    company_details: "A tech company focused on developing smart home safety solutions."
  },
  {
    project_title: "Portfolio Website with Blog",
    project_description: "Build a personal portfolio website with an integrated blog to showcase projects and write about experiences.",
    job_title: "Web Developer",
    job_description: "Design and implement a responsive website with content management features.",
    duration: "2 months",
    requirements: "HTML, CSS, JavaScript, CMS",
    category: "Web Development",
    closing_date: Date.today + 15,
    start_date: Date.today + 25,
    location: "Remote",
    user_id: users[3].id,
    company_name: "Freelance Project",
    perks: "Flexible deadlines, creative freedom",
    learning_outcomes: "Experience in personal branding and content management systems.",
    company_details: "A personal project aimed at enhancing online presence."
  },
  {
    project_title: "AI-Powered Personalized Fitness Coach",
    project_description: "Create an AI-powered fitness coach that generates real-time workout plans based on user health data and goals.",
    job_title: "Data Scientist",
    job_description: "Analyze user data to provide personalized fitness recommendations.",
    duration: "5 months",
    requirements: "Python, Machine Learning, Health APIs",
    category: "Artificial Intelligence",
    closing_date: Date.today + 30,
    start_date: Date.today + 40,
    location: "Los Angeles, CA",
    user_id: users[5].id,
    company_name: "FitAI",
    perks: "Gym membership, wellness programs",
    learning_outcomes: "Application of AI in health and fitness domains.",
    company_details: "A health tech startup focused on personalized fitness solutions."
  }
])



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
