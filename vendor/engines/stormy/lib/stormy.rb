require 'rails'
require 'active_support/core_ext/numeric/time'
require 'active_support/dependencies'
require 'set'
require 'securerandom'

require 'mongoid_paperclip'
require 'redcarpet'
require "stormy/engine"


module Stormy
  mattr_accessor :parent_controller
  @@parent_controller = "ApplicationController"

  
  mattr_accessor :post_image_styles
  @@post_image_styles = { } 

end
