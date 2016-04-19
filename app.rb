$LOAD_PATH.unshift File.expand_path(ENV['HOME'] + '/code/discourse_api_upstream/lib', __FILE__)
require File.expand_path(ENV['HOME'] + '/code/discourse_api_upstream/lib/discourse_api', __FILE__)
require 'json' 


# Authenticate
client = DiscourseApi::Client.new("http://localhost:3000")
client.api_key = "2e07ed2f1570c9dee581a4f4442d0a3f17ce951c6eb2807389217ced82422272"
client.api_username = "blake"

#client.api_key = nil
#client.api_username = nil

# Users
user = {
  name: "Norbert6",
  email: "norbert6@minion.com",
  password: "Password1!",
  username: "norbert6",
  active: "true",
  approved: "true"
}

#result = client.update_avatar(username: "norbert6", url: "http://vignette1.wikia.nocookie.net/despicableme/images/1/15/Jerryindespicableme.png")
#puts result

#new_user = client.create_user(user)
#puts new_user

#user = {
#  approved: true,
#  approved_by_id: 1,
#  approved_at: DateTime.now
#}
#
#updated_user = client.update_user('norbert5', user)
#puts updated_user


# Categories
#categories = client.categories
#puts categories

# List latest topics
#topics = client.latest_topics
#puts topics


# List topics in a category
#category_topics = client.category_latest_topics(category_slug: "parent-category")
#puts category_topics

# List topics in a category paged
#category_topics = client.category_latest_topics(category_slug: "test-category", page: "0")
#puts category_topics

#puts "######"

#category_topics = client.category_latest_topics(category_slug: "test-category", page: "5")
#puts category_topics

# Create a category
#category = {
#  name: "test_category",
#  color: "283890",
#  text_color: "FFFFFF",
#  description: "This is a description"
#}

#new_category = client.create_category(category)
#puts new_category


# Create a topic
#def random_string
#  ('a'..'z').to_a.shuffle.join
#end
#
#i = 0
#while i < 2 do
#
#  topic = {
#    title: random_string,
#    raw: random_string,
#    category: "test_category" 
#  }
#  
#  new_topic = client.create_topic(topic)
#  i += 1
#end
#
#
#puts new_topic['id']
#
#puts new_topic
#topic_id = new_topic['topic_id']

# Get a topic

#topic = client.topic(232)
#puts topic
#post_ids = [] 
#downloaded_posts = []
#posts = topic['post_stream']['posts']
#
#posts.each do |p|
#   post_ids.push(p['id'])
#   downloaded_posts.push(p['id'])
#end
#
#puts ""
#puts "stream"
#puts ""
#
#stream = topic['post_stream']['stream']
##puts stream
#
##stream.each do |s|
##  puts s
##end
#
#diff = stream - post_ids
#puts diff.slice(0, 19)
##posts_count = topic['posts_count']
##puts posts_count
##
#
#while diff.count > 0 do
#
#  response = client.topic_posts(232, diff.slice(0, 19)) 
#  response_posts = response['post_stream']['posts']
#  response_posts.each do |p|
#    downloaded_posts.push(p['id']) 
#    puts "#{p['id']} #{p['cooked']}"
#  end
#  diff = stream - downloaded_posts
#
#end
#response = client.topic_posts(232, post_ids) 
##puts response['post_stream']
#response_posts = response['post_stream']['posts']
#response_posts.each do |p|
#  puts p['id']
#end
# Create a post to a topic

#i = 0
#while i < 200 do
#  post = {
#    topic_id: topic_id,
#    raw: random_string
#  }
#  new_post = client.create_post(post)
#  puts new_post
#  i += 1
#end

# Dashboard

#dashboard = client.get_stats
#puts dashboard
#global_reports = dashboard['global_reports']
#puts global_reports

#global_reports.each do |a|
#  puts a.type
#end

#global_reports['type']
#users = global_reports[1]
#total_users = users['total']
#puts total_users

#topics = global_reports[3]
#total_topics = topics['total']
#puts total_topics

#posts = global_reports[4]
#total_posts = posts['total']
#puts total_posts

totals = client.get_dashboard_stats_totals

puts totals
