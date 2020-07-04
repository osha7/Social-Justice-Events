
# by running this file YOU WILL LOSE any previously created Users, Events, & UsersEvents

# ONLY RUN THIS FILE -  MAKING SURE LINES 3-5 are present and run first
# UsersEvent creations are dependent on specific users and events

User.destroy_all # !!!!!!!
Event.destroy_all # !!!!!!!
UsersEvent.destroy_all # !!!!!!!

User.create({:name => "Yvonne", :username => "yvonne7", :email => "yvonne@gmail.com", :password => "hello"})
User.create({:name => "Nathan", :username => "nathan7", :email => "nathan@gmail.com", :password => "hello"})
User.create({:name => "Clemence", :username => "clemence7", :email => "clemence@gmail.com", :password => "hello"})

Event.create({
    :title => "Event 1",
    :category => "Pride",
    :address => "4219 Pecos St",
    :city => "Denver",
    :state => "CO",
    :zip => "80211",
    :date => "2020-09-01",
    :time => "2000-01-01 09:00:00",
    :about_content => "seed - test"
})

Event.create({
    :title => "Event 2",
    :category => "Families Belong Together",
    :address => "1437 Bannock St",
    :city => "Denver",
    :state => "CO",
    :zip => "80202",
    :date => "2020-10-01",
    :time => "2000-01-01 17:00:00",
    :about_content => "seed - test"
})


Event.create({
    :title => "Event 3",
    :category => "Impeach The President",
    :address => "1437 Bannock St",
    :city => "Denver",
    :state => "CO",
    :zip => "80202",
    :date => "2020-08-01",
    :time => "2000-01-01 15:00:00",
    :about_content => "seed - test"
})

UsersEvent.create({
    :user_id => "1",
    :event_id => "2",
    :admin => "true",
    :comment => "I'm this events' organizer!"
})

UsersEvent.create({
    :user_id => "2",
    :event_id => "1",
    :admin => "true",
    :comment => "I'm this events' organizer!"
})

UsersEvent.create({
    :user_id => "3",
    :event_id => "3",
    :admin => "true",
    :comment => "I'm this events' organizer!"
})