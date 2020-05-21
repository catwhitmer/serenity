[x] Use the Ruby on Rails framework. - I used rails.

Your models must:

[x]• Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships
-the appointment belongs to User and Massage
-the user has many appointments and many massages through appointments
-the massage has many appointments and many users through appointments

[x]• Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user
-The appointment table is the join table and includes both user and massage foreign keys

[x]Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.
-the user has username presence and uniqueness validations
-the appointment and the massge both have attribute presence validations

[x]You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).
-the appointment has a search by location scope method
-the massge has a recent and a search by length scope method

[x]Your application must provide standard user authentication, including signup, login, logout, and passwords.
-used both the becrypt gem and the has_secure_password method

[x]Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...
-used the facebook omniauth

[x]You must include and make use of a nested resource with the appropriate RESTful URLs.
-the massages have an appointment nested route

[x]• You must include a nested new route with form that relates to the parent resource
-the apppointments includes massage attributes in its form

[x]• You must include a nested index or show route
-the appointment includes nested routes that include massages

[x]Your forms should correctly display validation errors.
-all forms display error messages

[x]a. Your fields should be enclosed within a fields_with_errors class
-they do

[x]b. Error messages describing the validation failures must be present within the view.
-they do

[x]Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.
My app is dry

[x]• Logic present in your controllers should be encapsulated as methods in your models.

[x]• Your views should use helper methods and partials when appropriate.
-I used the route helpers thoroughtly throughout my app.

[x]• Follow patterns in the Rails Style Guide and the Ruby Style Guide.
-I used rails style guide

[x]Do not use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding.
-I did not use the scaffold generator to create my app