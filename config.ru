require 'bundler'
Bundler.require

#require './controller'
$:.unshift File.expand_path("./../lib", __FILE__)
require 'controller'
run ApplicationController