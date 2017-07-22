class User < ApplicationRecord
  belongs_to :document_type

  validates_presence_of :document_number, :name, :lastname, :email, :phone

  validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates_format_of :document_number, with: lambda{ |user|
    Regexp.new(user.try(:document_type).try(:format) || '')
  }
end
