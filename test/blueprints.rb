require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.define do
  email { Faker::Internet.email }
  name { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
  username { "#{Faker::Name.first_name}_#{Faker::Name.last_name}".gsub(/'/, '')[0,15].downcase }
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

# Post.blueprint do
#   user { User.make }
# end

User.blueprint do
  email { Sham.email }
  password 'test'
  name { Sham.name }
  username { Sham.username }
end
