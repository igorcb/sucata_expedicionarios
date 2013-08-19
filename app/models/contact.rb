class Contact < ActiveRecord::Base
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  VALID_PHONE = /\A[0-9]{1,}\z/
  
  validates :name, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :phone, presence: true, format: { with: VALID_PHONE }
  validates :subject, presence: true
  validates :message, presence: true
  
  before_save { self.email = email.downcase }
end

# -*- coding: utf-8 -*-
class Regex
  DATE     = /^(0?[1-9]|[12][0-9]|3[01])[\/](0?[1-9]|1[012])[\/]\d{4}$/
  EMAIL    = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  PHONE    = /^$|^[0-9]{2}[0-9]{4}[0-9]{4}$/
  STRING   = /^[a-zA-ZÀ-ÿ ]+$/x
  SPMOBILE = /^$|^11[0-9]{5}[0-9]{4}$/
end
 
#validates :aniversario, format: { with: Regex::DATE , allow_blank: true }