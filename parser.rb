require 'rubygems'
require 'mechanize'
require 'pp'

user_ids = ['142917', '153132']
agent = Mechanize.new

# Login
agent.get('http://ivao.aero/members/person/details.asp')
form = agent.page.forms.first
form['Id'] = ENV['LOGIN']
form['Pwd'] = ENV['PASSWORD']
form.submit

# Get user names
user_ids.each do |user_id|
  agent.get("http://ivao.aero/members/person/details.asp?ID=#{user_id}")
  name = agent.page.search("table font")[0].children.text
  puts "id: #{user_id} name: #{name}"
end