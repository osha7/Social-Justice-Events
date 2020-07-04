
1. ADMIN EVENT SHOW ON USER PAGE
model#events_where_admin
    -use this method to be able to determine admin - so only admin can edit/delete ? DONE - but with a different method (in event model)
    -can I use this method somehow get events on show page (where user is admin) ?

2. YESSS!!!!!  All set - with flash notices!
Users can only sign up 1x for event

3.  NO

to have users 'join' events
    -should I have an attribute of join 
    -in order to make a checkbox to check?
 

4. USERS WILL NOW SIGN IN w. A COMMENT - not make random comments

how do I use comments attribute from join table of user_events
    -to make comments section on each event show page

5.
Nested Routes
A - index or show
B - new

6. YESSSSSSSSSSSS
Scope method
    6b.  ALL SET!
        Don't show past events
        scope :past, -> { where("Date < ?", Date.today).order('Date DESC') }

7.
Categories - Separate Model (?)

8.
Delete your own rsvp's if needed

9.




