$:.unshift File.expand_path("../", __FILE__)

require 'bundler'
Bundler.require

require 'jet_fuel'

run JetFuel
