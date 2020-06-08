# TarheelTeachers
Message Board for North Carolina Educators

This is a project I created as part of the course requirements for Flatiron School's online web development program. It is intended as a message board for people who work in the education sector to discuss issues relevant to their profession. (Note: Though called "Tarheel Teachers" -- largely because North Carolina is my state and my wife is a public school teacher -- the app can easily be adapted to fit a variety of users, not just educators in North Carolina.) 

Tarheel Teachers is a Rails CRUD app. All users can create posts (called 'discussions') that fall under particular categories or topics (called 'forums') for others to view and/or comment on, and of course they can comment on other users' discussions. The app also allows users to edit or delete their own discussions and comments. To provide 'admin' and 'moderator' roles, the app includes the gems CanCanCan and Rolify. Users designated as moderators have the added ability to edit and/or delete other users' discussions and comments, not just their own. Users designated as admins likewise have that same ability. In addition, admins may create, edit, and delete forums, and they may even delete another user's account. 

Rolify's documentation (https://github.com/RolifyCommunity/rolify) explains how to assign user roles. 
