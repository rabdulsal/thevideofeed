require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.define do
  email { Faker::Internet.email }
  name { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
  username { "#{Faker::Name.first_name}_#{Faker::Name.last_name}".gsub(/'/,'')[0,15].downcase }
end

# FeedItem.blueprint do
#   post { Post.make }
#   user { User.make }
#   post_id { post.id }
#   poster_id { post.user_id }
#   post_created_at { post.created_at }
# end

# Follow.blueprint do
#   follower { User.make }
#   following { User.make }
# end

Post.blueprint do
  user { User.make }
  video { Video.make }
end

User.blueprint do
  email { Sham.email }
  password 'test'
  name { Sham.name }
  username { Sham.username }
end

Video.blueprint do
  canonical_url { "http://www.youtube.com/watch?v=oHg5SJYRHA0" }
  author_name { "cotter548" }
  author_url { "http://www.youtube.com/user/cotter548" }
  description { "RickRoll'd\r\n\r\nHe's Back!\r\nOMG OMG OMG OVER 30 MILLION RICKROLL'd!" }
  height { "385" }
  html { "<object width=\"640\" height=\"385\"><param name=\"movie\" value=\"http://www.youtube.com/v/oHg5SJYRHA0&fs=1\"><param name=\"allowFullScreen\" value=\"true\"><param name=\"allowscriptaccess\" value=\"always\"><embed src=\"http://www.youtube.com/v/oHg5SJYRHA0&fs=1\" type=\"application/x-shockwave-flash\" width=\"640\" height=\"385\" allowscriptaccess=\"always\" allowfullscreen=\"true\"></embed></object>" }
  provider_name { "YouTube" }
  provider_url { "http://www.youtube.com/" }
  thumbnail_height { "90" }
  thumbnail_url { "http://i.ytimg.com/vi/oHg5SJYRHA0/default.jpg" }
  thumbnail_width { "120" }
  title { "RickRoll'D" }
  url { "http://www.youtube.com/watch?v=oHg5SJYRHA0" }
  version { "1.0" }
  width { "640" }
end
