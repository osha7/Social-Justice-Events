class Angela

    has_many children
    has_many classes, through school



class Children
    belongs_to angela


class Student


class School
    has_many students, through classes
    


class Classes