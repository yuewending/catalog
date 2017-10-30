# Midterm

## Setup

 1. You should have gotten here by clicking the assignment from within Canvas.
 1. Setup [a Cloud9 workspace](https://guides.firstdraft.com/getting-started-with-cloud-9.html) as usual **with one exception**; choose "Private" rather than "Public". We're going to use our one and only Private workspace in Cloud9's free tier today.
 1. In a Terminal, run `bin/setup`.
 1. Run Project and visit your app in Chrome.
 1. Enable Auto-save and refresh Cloud9.
 1. Check your progress/submit your work with `rails grade:all` as usual.

> If at any point `rspec` fails with the message "Migrations are pending. To resolve this issue, run: bin/rake db:migrate RAILS_ENV=test" then run
>
> `rails db:migrate RAILS_ENV=test`

## Rules

You may refer to your notes, homeworks, the Ruby docs, GitHub, the forum, or anything else **except** for a live person (e.g., one of your classmates or a developer friend).

Close/put away/don't use any messaging client, including but not limited to email, Slack, SMS, smart watches, walkie talkies, or vocal chords.

## Hints

 - Use `/git` to **commit and branch often**; in particular, after you complete a problem and before you start the next.
 - Let Ruby's error messages guide you. They are trying to be helpful; they just have poor social skills. Try to make sense of their overly formal wording. The error pages also display helpful information like what controller and action were being routed to, and what was in the `params` hash.
 - Refer to your past work. This isn't a memorization competition.
 - **If you encounter an error that you think is environment or git related, ask a Private question on Piazza; we’ll tell you if it’s something you should be figuring out on your own or not.** If it's HTML, Ruby, RCAV, params, or CRUD-related, we can't help; but we can tell you the difference.
 - You don’t have to worry about CSS styling at all; just get the app to do the right thing.
 - **Use the server log** to verify that URLs are being routed to the actions you think they are, and to see what is coming in to the `params` hash.
 - In your browser, don’t get confused between the target app and your development app. Make sure you are refreshing your own app to test your work.
 - Don't get stuck on any one thing for too long; move on and score easy points on the next problem.

## Introduction

This application has 3 database tables:

 - coffee beans (columns: blend name, variety, origin, notes)
 - foods (columns: ingredient, spice, measurement, store address)
 - lists (columns: title, description)

Each resource needs 7 "golden" actions to allow users to interact with it:

### CREATE

 - new_form
 - create_row

### READ

 - index
 - show

### UPDATE

 - edit_form
 - update_row

### DELETE

 - destroy

For the first two, the Golden Seven exist but are buggy. **Your primary job** is to debug them all until you can create, read, update, and delete each of coffee beans, and foods without running into any issues. Your secondary job is to do a bit of geocoding on the show page of Foods.

Then you have to build the Golden Seven for Lists from scratch.

### [Here is your target.](https://catalog-debug-target.herokuapp.com/)

Make yours work like it. Your local app is using a light theme, and the reference app is using a dark theme so that you don't get confused between tabs as you try to check your work.

Click through the app and debug. Try adding a new coffee bean, updating a coffee bean, looking at the details of a coffee bean, and deleting a coffee bean.

Sometimes you will get an error message; sometimes there won't be an error message, but the action just won't do its job. **Use the server log to help figure out what's going on.**

---

All in all, you need to:

 - Fix the Golden Seven for Coffee Beans.
 - Fix the Golden Seven for Foods.
 - Build the Golden Seven for Lists from scratch. I've already generated the model for you, so you just have to do the RCAVs.
 - Some geocoding: On the show page for each food, display the correct latitude and longitude of the food based on the value in its `store_address` column. Currently, every food shows the same latitude and longitude, which is wrong. Use Google's Geocoding API.

> In the unlikely case that you reach Google's Maps API free usage limit, use the following API URL stub:**

> https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyB_nAWVr-18Oi_XoadzVHmNT2vevvJfev4&address=LOCATION GOES HERE

> It contains my API token in one of the query string parameters, so should lift the limit.

---

**OPTIONAL:** Last, work on centering the embedded Google Map on the show page for each food on its real store address. Currently, every map is centered on the same location (the White House), which is wrong. Replace the static bits of the JavaScript that you want to be dynamic with embedded Ruby, the same as you do with HTML.
