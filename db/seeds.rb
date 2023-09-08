# Crear un usuario
user = User.create!(
    email: 'test@example.com',
    password: 'password123',
    password_confirmation: 'password123'
  )
  
  # Crear ofertas de trabajo
  5.times do |i|
    JobPosting.create!(
      title: "Job #{i + 1}",
      description: "Description for job #{i + 1}",
      # otros campos que puedas tener
    )
  end
  