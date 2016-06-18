# @SomePoint (Project-02)
Task organizer with Google Routes API &amp; Traffic

## User Story

- User is presented with the issue of having multiple tasks at multiple locations and needs to find the most efficient way to complete tasks considering locations and distances.

- Navigates to the @somepoint app and is blown away from how great the layout is. Splash page serves as the home page with logo and a login form in the nav bar with a sample login user in place and a button to a signup a custom user.

- User either clicks login (using the sample user) or selects the sign up option which requires their user name, email address, password and optional profile image. Once all the fields are filled out, user hits submit which takes them to the user’s profile and task entry list.

- If user already has an account, they can over write the sample user in the login fields and click the login button to login and be taken to the user profile and tasks page.

- Once on the user profile and task page, the user enters tasks that need to be completed. The user can input up to 10 tasks. Each task can be updated or deleted.

- The specifics for each task include a description of what needs to be done, and a location. The location will typically be an address, but entries such as "the white house" or longitude/latitude can be entered. Google routes top best guess will the the destination.

- Once all information is entered, user hits submit and the task entry page is replaced with the maps page with a list of the tasks. The map page, is actually back to the home page with hidden and reveled fields using rails ".erd" code.

- The user will be able to select a start and stopping task, and select any additional tasks on the list that need to be completed. When complete, they can hit the submit button to see their locations and the best order to do them in on the map.
