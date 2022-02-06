# frozen_string_literal: true

json.extract! poster, :id, :title, :author, :created_at, :updated_at
json.url poster_url(poster, format: :json)
