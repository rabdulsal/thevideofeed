require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.define do
  login { "#{Faker::Name.first_name}_#{Faker::Name.last_name}".gsub(/'/, '')[0,15].downcase }
  email { Faker::Internet.email }
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
  # login { Sham.login }
  email { Sham.email }
  password 'test'
end
