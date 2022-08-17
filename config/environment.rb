# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# carrierwave追加のため追記
require 'carrierwave/orm/activerecord'
