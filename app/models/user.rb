class User < ApplicationRecord
  has_many :articles
  validates :username, uniqueness: {case_sensitive: false}, presence:true, length: {minimum: 3, maximum: 25}
  validates :email, uniqueness: {case_sensitive: false}, presence:true, length:{maximum: 105}, 
                    format: {with: URI::MailTo::EMAIL_REGEXP}
end