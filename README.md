# README

## Introduction
This app has been made in an effort to meet the MVP of the requirements outlined in https://tech.olioex.com/rails-coding-task.html
I have used the latest version of rails and ruby and the system should run on http://127.0.0.1:3000 when run locally with ```rails server```
Only other gems involved are ```bcrypt``` which is featured in the GemFile of Rails as standard in new projects and ```HTTParty``` to simplify accessing the list of articles.

### Setting up the database
There are only two migrations that should both run with ```rails db:migrate``` that create the data structures for Articles and Users.

### Running Tests
The test suite currently consists of 16 tests of which two have been set up with the ```flunk``` assertion as discussion points of things that would require improvement for a production system but do not currently add towards the given criteria of the coding task.
To run the suite run ```rails test```

## Fulfilling of the MVP
The criteria in the coding task was to demonstrate both coding proficiency and working practices. At it's simplest this was to be a web page with a list that a user could interact with in a nominal way and persist that data. On that count it is successful and fulfills the minimum requirement of functionality.

### Loading Data
In the interest of simplicity and having the most up to date information the list of articles is retrieved when loading the webpage. The data is read in from the JSON and stored in an Article model using an upsert statement. This means articles no longer available from that end point could potentially still be accessible in future but also maintains the articles that are still live.

The IDs from the JSON are persisted into the database and the Likes are stored with those IDs. This could mean if the title of an article changes but the ID does not the Likes would persist against that new title which may or may not be desirable behaviour.

### Displaying Data
The website refers to each item as an Article still both on the front end and in variables to maintain the ubiquitous language from the task outline.
The website features a short welcome section at the top where a User can be welcomed as a guest. There are also buttons that will show for Guests that allow them to create an account or sign in. Signed in guests are welcomed by their chosen username and a button to log out if they wish is included.

The data itself is displayed in a table with total likes on the Left, the Title in the middle and a button on the right to contribute a Like. Icons to indicate a like have been including but there is currently minimal styling on the application. Ideally styling would be in the ```assets``` folder of the ```app```, focusing on giving the display of data a more even look and some variation to make each line easier to read. Table styling and a nicer font across the website would give a more professional and user friendly look.

### Liking Articles
Currently guests and users have the same functionality of being able to like a product indefinitely. Initially I wanted to implement a means of tracking a signed in Users likes and unfortunately spent more time on this than was ideal. The infrastructure of my last attempt is still contained within the code and whilst aspects of it seemed to work in tests it ultimately failed. The solution would be to create a relational model that represented the items liked by a User that was non-destructive so likes from deleted Users still persisted and, if desirable, Users could still access Articles they had liked that may no longer be available.

Plans were to replace the Like button with an icon indicating the item had been liked by the User and also change the display of the heart outline on the left next to the total likes count with a solid filled heart. How this would work is still in the partial render for signed in Users on the main Articles page

### Accounts
A boilerplate sessions system has been added to the project with basic logging in and User creation functionality to prove the Likes are persistent despite the User, the Likes are a property of the Article and persist when refreshing the page, when signing in as someone else, when viewing in private browsing and between taking down and reinstating the ```rails server``` as long as the database is not destroyed between uses.

The Accounts have very basic testing from when I was putting the classes together and are by no means rigorous. Much more security would be required to ensure that the Account system was fit for production. This would include validation on usernames, emails (if a required field), passwords and a reworking of the way of tracking which Articles a User had liked. As the technical task was focusing on applying Likes to an Article and persisting it the Account system is purely there to support the proof of functionality and unfortunately not a thorough example of skill.

#### Sessions
In a similar vein, the Session data is from a project done when following a course in an older version of rails and is there as a simple way of keeping accounts signed in one at a time and would likely require a bit of updating for modern Rails standards and ideally some tests wrapped around it to avoid surprises.

## Code Rigor and Practices
The code has been fully linted with Rubocop with two offenses in the Session control and the only ignored linting being that each class should have an introductory comment. I am a firm believer that clean code needs no real introduction and should be clearly named at every step possible. Likewise if the code is complex or not quite so clean as we'd hope a comment at the top isn't going to make things much clearer.

I also ran the gems Flog and Flay which give reports on how torturous code is to follow and maintain. The numbers are largely arbitrary much like traditional estimation in Scrum and are used for developers to gauge areas for improvement or times where they may want to ensure extra time is taken into account when maintenance or bug reports come through as more tortuous code typically takes longer to understand and untangle.

Through Flog the more tortuous methods are:
* Creating a Session
* Creating a User
* Likes attributed to a User (from both the User Controller and the remnant code in the Articles Controller)
This indicates we likely want to break up the code and possibly create helper classes to manage security in Sessions and Users as greater rigor is only going to make those more complex. It also indicates the User Likes is something that may require rethinking to greatly simplify how it should be implemented.

Through Flay we see there is duplication of code between the partial renders on the Article page. This is the only real duplication in the project and has arisen as a result of the intended changes to have User Likes in place. The Duplication would likely fall out should a system be implimented successfully or result in the partial renders being unified and incorporated in the index page.

### Commits
My commits have been admittedly sparse and terse on this project. Typically commits would relate to blocks of completed work, on a task of this nature I found it very easy to find myself simply moving onto the next point in the list and noting down refinements as I continued. A card or story reference should be included in each commit and the details should be short and reference any potential conflicts of other work in progress.

## Conclusion
The MVP from the task brief has been completed with the potential for expansion in both accessing Article data easily and providing Users means of interacting with the Articles in a more secure and traceable manner. The functionality has been prioritised over the form which could be greatly improved with some basic CSS and a little bit of time checking the page on different devices and screen resolutions. Though should have enough common elements with similar platforms and other websites that a new user wouldn't be confused about the presentation.