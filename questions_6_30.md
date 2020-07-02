
1a.
model#events_where_admin
    -use this method to be able to determine admin - so only admin can edit/delete ? DONE - but with a different method (in event model)
    -can I use this method somehow get events on show page (where user is admin) ?

1b. YESSS!!!!!  All set - with flash notices!
Users can only sign up 1x for event

2.  NO

to have users 'join' events
    -should I have an attribute of join 
    -in order to make a checkbox to check?
 

3. USERS WILL NOW SIGN IN w. A COMMENT - not make random comments

how do I use comments attribute from join table of user_events
    -to make comments section on each event show page

4.
Nested Routes

5.
Scope method
    5b.  ???
        Don't show past events
        scope :past, -> { where("Date < ?", Date.today).order('Date DESC') }

6.
Categories - Separate Model (?)





