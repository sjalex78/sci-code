# frozen_string_literal: true

class Poster < ApplicationRecord
  has_many :contributors, dependent: :destroy
  has_many :users, through: :contributors
  has_many :components, dependent: :destroy
  belongs_to :user
end
