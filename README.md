# README

# Welcome to My Basecamp 2
***

## Task
This project is a task management system that allows users to:
Register and authenticate Manage projects, Assign admin roles,, Attach files to projects
Create discussion threads within projects, Send messages in threads.
It includes user authentication, project management, role-based access control (RBAC), file attachments, and discussions within projects.
challenges i faced with this project are not much as basecamp 1 gave me an upperhand. i used active storage for my attachments, i used scaffold for my thread, i also created messages inside my thread for users associated with project. i watched alot of videos on youtube too, and read more about ruby documentation.
Also i cloned my repo on a personal laptop and made changes to my project, but after i pushed i noticed that in my commit history its showing user, unlike the rest that is showing my username. i tried to configure but to no avail. it was brought to the attention of my project manager.


## FEATURES
User Registration & Authentication
-User Registration
Create a new user account (User new, User create).
View user profile (User show).
Delete an account (User destroy).

-User Sessions
Log in (User sign_in).
Log out (User sign_out).
Role Permissions
Set an admin role (User setAdmin).
Remove an admin role (User removeAdmin).
Only admins can manage user roles and access the admin dashboard.
Project Management
Create a project (Project new).
View project details (Project show).
Edit an existing project (Project edit).
Delete a project (Project destroy).
Users can own and manage multiple projects.
Attachments in Projects
Upload and attach files to projects (Attachment create).
Delete project attachments (Attachment destroy).

-Project Threads & Messages
Threads (Admin-Only)
Admins can create discussion threads inside projects (Thread new).
Admins can edit discussion threads (Thread edit).
Admins can delete discussion threads (Thread destroy).

-Messages (For Associated Users)
Users associated with a project can send messages in a thread (Message new).
Users can edit their messages (Message edit).
Users can delete their messages (Message destroy).

## Description
To implement this project, i build on the knowlegde i got from basecamp 1, and watched additional tutorials to equip my self. 


## Installation
-clone the repository locally to your device. 
-navigate to your project folder.
-bundle install. 
-Set up the Database 
-rails db:create 
-rails db:migrate 
NOTE: if during migaration you eccounted an error telling you that roles table exist, just drop the tables and generate new ones by migrating again. after migration create an admin through the console using:
rails console, inside the console
    user = User.find_by(email: "user_email") Replace "user_email" with the actual email
    user.add_role :admin
    if tables were not dropped you can log in with this user who is an admin 
    email: lewiwajak@gmail.com
    password:883256
    all this would be done after server has started and that depends if tables were dropped.
-rails db:seed 
-Start the server (rails server)

## Usage
-User Registration & Authentication
Users can sign up and delete their accounts.
Authentication is handled securely using Devise.
-Project Management
Users can create, edit, and delete projects.
Projects are associated with users through a ProjectUser join table.
-File Attachments
Users can upload and remove attachments from projects.
-Threads & Messages
Admins manage discussion threads inside projects.
Users associated with a project can post, edit, and delete messages within threads.
-Admin Dashboard & Role Management
Admins can promote or demote users between normal users and admins.
The admin dashboard is visible only to admins.

## Tech Stack
-Ruby on Rails (Backend)
-Devise (User Authentication)
-Rolify (Role-Based Access Control)
-Bootstrap (UI Styling)
-SQLite (Database)

### The Core Team
Lewi Wajak Abbai
Outsource Global Academy


<span><i>Made at <a href='https://qwasar.io'>Qwasar SV -- Software Engineering School</a></i></span>
<span><img alt='Qwasar SV -- Software Engineering School's Logo' src='https://storage.googleapis.com/qwasar-public/qwasar-logo_50x50.png' width='20px' /></span>