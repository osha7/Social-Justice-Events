
Social Justice Event App
-----------------------------

User / (((Attendee)))

-has_many :events, through: :user_events






Events

-has_many :users, through: :user_events






UserEvents

-belongs_to :users
-belongs_to :events
-comments (?)
-attendees (?)


