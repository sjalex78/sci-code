# frozen_string_literal: true

class EnablePgcrytoExtension < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'
  end
end
