$LOAD_PATH.unshift File.expand_path(ENV['HOME'] + '/code/discourse_api/lib', __FILE__)
require File.expand_path(ENV['HOME'] + '/code/discourse_api/lib/discourse_api', __FILE__)
#require 'discourse_api'
require 'json'
require 'yaml'
require 'date'

@config = YAML.load_file('config.yml')
site = ENV['SITE']

api_key = @config[site]['api_key']
api_username = @config[site]['api_username']

HOST = @config[site]['host']

# Authenticate
@client = DiscourseApi::Client.new(HOST)
@client.api_key = @config[site]['api_key']
@client.api_username = @config[site]['api_username']


def random_string
  ('a'..'z').to_a.shuffle.join
end

def create_topic
  topic = {
    title: random_string,
    raw: random_string,
    #category: "test_category"
    tags: ['asdf', 'fdsa']
  }
  #@client.api_username = 'api'
  new_topic = @client.create_topic(topic)
  puts new_topic
end

def get_dashboard_stats
  puts @client.get_dashboard_stats
end

def get_dashboard_stats_totals
  puts @client.get_dashboard_stats_totals
end

def badges
  puts @client.badges
end

command = ARGV[0]
if command == nil || command == ""
  puts "Please enter a valid command"
  exit 1
end

case command
when "create-topic"
  create_topic
when "get-dashboard-stats"
  get_dashboard_stats
when "get-dashboard-stats-totals"
  get_dashboard_stats_totals
when "badges"
  badges
end

exit 0
#puts client.sync_sso(
#  sso_secret: 'abcdefghij',
#  name: random_string[0..10],
#  username: random_string[0..10], 
#  email: "#{random_string[0..10]}@example.com",
#  external_id: '225',
#  custom_fields: {
#    "user_field_1": random_string
#  }
#  #"custom.user_field_1": random_string
#)

#puts client.sync_sso(
#  sso_secret: 'abcdefghij',
#  username: '24db27218ed09205a5a0', 
#  name: '24db27218ed09205a5a0', 
#  email: '24db27218ed09205a5a076983bf241ab@test.com',
#  external_id: '823',
#  avatar_url: 'https://d3bpeqsaub0i6y.cloudfront.net/user_avatar/meta.discourse.org/%D0%B8%D0%BB%D1%8C%D1%8F_%D0%BA%D0%BE%D0%BC%D0%B0%D1%80%D0%BE%D0%B2/90/183981_2.png',
#)
#
#exit 0


#puts client.post('/admin/plugins/explorer/queries/2/run', { params: '{"name":"system"}', explain: false })

#client.ssl({:verify => false})

# add users to group
#group_id = 41
#puts client.group_add(group_id, usernames: ["zOSRHECKTGYVJMQPBDU", "bnvdlaiymkhzpurjosx"])
#puts client.group_add(group_id, user_emails: ["bnvdlaiymkhzpurjosx@example.com"])
#puts client.group_remove(group_id, user_email: "baquomkeyctvnhwgjfz@example.com")
#puts client.group_remove(group_id, usernames: ["zOSRHECKTGYVJMQPBDu", "bnvdlaiymkhzpurjosx"])



#client.api_key = nil
#client.api_username = nil

# Get latest topics
#topics = client.category_latest_topics(category_slug: "lounge")
#puts topics


#puts client.site_setting_update(name: 'disable_emails', value: 'yes')

# Get latest topics from a bad category
#topics = client.category_latest_topics(category_slug: "not_found")
#puts topics

#topics = client.category_top_topics(category_slug: "lounge")
#puts topics


# Users
#user = {
#  name: "Norbert6",
#  email: "norbert6@minion.com",
#  password: "Password1!",
#  username: "6",
#  active: "true",
#  approved: "true"
#}

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


# Create multiple users 


#i = 0
#while i < 200 do
#
#  username = random_string[0,19]
#
#  user = {
#    name: username,
#    email: "#{username}@example.com",
#    password: "Password1!",
#    username: username.upcase,
#    'user_fields[1]' => random_string[0,10],
#    'user_fields[2]' => random_string[0,10]
#  }
#  
#  new_user = client.create_user(user)
#  puts new_user
#  user = {
#    approved: true,
#    approved_by_id: 1,
#    approved_at: DateTime.now
#  }
#  
#  updated_user = client.update_user(username, user)
#  i += 1
#  exit 1
#end

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

#i = 0
#while i < 2 do

  topic = {
    title: random_string,
    raw: random_string,
    #category: "test_category"
  }
  
#  client.api_username = 'api'
  new_topic = client.create_topic(topic)
  puts new_topic
#  i += 1
#end
#
#
#puts new_topic['id']
#
#puts new_topic
#topic_id = new_topic['topic_id']
#puts topic_id
#
# Get a topic
#params = {print: true}
#topic = client.topic(8, params)
#posts_count = topic['posts_count']
#puts "post_count: #{posts_count}"
#post_ids = []
#downloaded_posts = []
#posts = topic['post_stream']['posts']
#puts "posts count: #{posts.count}"

#posts.each do |p|
#  post_ids.push(p['id'])
#  downloaded_posts.push(p['id'])
#  puts "#{p['post_number']}: #{p['cooked']}"
#end
#
#stream = topic['post_stream']['stream']
#diff = stream - post_ids
#
#while diff.count > 0 do
#
#  response = client.topic_posts(8, diff.slice(0, 19))
#  response_posts = response['post_stream']['posts']
#  response_posts.each do |p|
#    downloaded_posts.push(p['id'])
#    puts "#{p['post_number']}: #{p['cooked']}"
#  end
#  diff = stream - downloaded_posts
#end

#response = client.topic_posts(8, post_ids)
#puts response['post_stream']
#response_posts = response['post_stream']['posts']
#response_posts.each do |p|
#  puts p['id']
#end

# Create a post to a topic

#topic_id = 8
#i = 0
#while i < 200 do
#  post = {
#    topic_id: topic_id,
#    raw: random_string
#  }
#  new_post = client.create_post(post)
#  puts new_post
#  sleep 1
#  i += 1
#end


## Download all posts in a topic


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

#totals = client.get_dashboard_stats_totals

#puts totals
