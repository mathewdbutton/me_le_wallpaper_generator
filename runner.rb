#!/usr/bin/env ruby

require_relative "image_builder"

require "thor"

class MyCLI < Thor
  desc "generate", "generates a new wallpaper"
  def generate
    ImageBuilder.generate
  end
end

MyCLI.start(ARGV)