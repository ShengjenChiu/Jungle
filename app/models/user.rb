class User < ApplicationRecord
  has_secure_password #gives our User model authentication methods via bcrypt
end
