# Resource Practice

This application has 4 database-backed web CRUD resources: directors, movies, roles, and actors.

As usual, each resource has 7 "golden" actions that allow users to interact with it:

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

There are bugs in most of the 28 actions required to CRUD our 4 resources. Your job is to debug them all until you can create, read, update, and delete each of directors, movies, roles, and actors without running into any issues.

Here is a fully functional version of the app, for your reference.

https://resource-practice.herokuapp.com/

Make yours work like it. Your local app is using a dark Bootswatch, and the reference app is using a light Bootswatch; don't get confused between the tabs as you try to check your work.

Use the detailed README of the Photogram Golden Seven project as a reference.

## Setup

1. Ensure that you've forked this repo to your own GitHub account.
1. Set up [a Cloud9 workspace as usual](https://guides.firstdraft.com/getting-started-with-cloud-9.html) based on this repo.
1. `bin/setup`
1. Run Project
1. Navigate to the live app in Chrome.

You should see a list of movies. The `Movies#index` action is functional, and I have set it to be the root URL.

From here, click through the app and debug. Try adding a new movie, updating a movie, looking at the details of a movie, and deleting a movie.

Sometimes you will get an error message; sometimes there won't be an error message, but the action just won't do its job. Use the server log to help figure out what's going on.

After Movies, work on Directors, then Actors, then Roles.

##1
