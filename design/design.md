# blox design brainstorming
blox offers one unified inbox for all your social media. Built in Swift and using Realm for iOS. This document captures the brainstorming sessions between UX designers and iOS developers.

![](https://raw.githubusercontent.com/duliodenis/blox/master/art/AppIconSet/Icon-40@2x.png)

### Team Collaboration Tool
We discuss the merits of and have decided to try [wake.io](http://wake.io) for collaborative design. 

### Blox Message Replies

Every social media stream has a different "message" system. For FB is a comment, for twitter is it a @ comment or direct message, for Instagram is it a comment. There are two ways we can approach messaging:

1. **External**: One idea in order to make this work would be to not have the user be able to interact with the content of the social media posts within the app. If they wanted to do anything (like, comment etc.) they would be transferred to that social app. Want to respond to a FB comment - app takes you to FB.
2. **Native**: Another approach is we syphon the messages and store them all on device and respond to them from within the app. This would unify the messaging system to present them as one to the user across all the platform services. It also has the benefit of caching the messages locally and allow for offline mode. 

### Blox Of Time
The core design principle of the app is to make interacting with your social media stream more efficient and streamlined. This central pillar is to make the many streams become one. But some streams are already a firehouse of chatter and with unification this effect would only magnify and overwhelm a user.

With so much social media content coming at us all the time what if this app was to only give the user a "block" of unified social media for a certain time period. For example, the app will only give the user content from the last hour and that is it - then the stream ends (they could change it to whatever time block they wanted in hours or days). 

In this fashion it is like reading all your emails in your inbox and then you are done and can move on. You achieve the satisfaction of Inbox Zero for that time block and are caught up. The amount of social media you are taking in is "contained." 

### Workflow Design
This is the user workflow that we imagine:

![](https://raw.githubusercontent.com/duliodenis/blox/master/design/images/1-UserWorkflow.png)

1. User picks social networks to be connected to
2. User logins in to social networks to connect with blox (example: timehop)
3. User can view the social media feed
4. User wants to comment/interact with a post 
5. Side menu has a place to add/subtract social media feeds, add time block, settings etc.

### Connecting to social media apps

The usser taps on social media they want to be connected and then login and then are brought back to be connected to the next social media app. 

![](https://raw.githubusercontent.com/duliodenis/blox/master/design/images/2-ConnectionsManager.png)

### Social Media Feed [Option A]

![](https://raw.githubusercontent.com/duliodenis/blox/master/design/images/3-SocialMediaFeed-A.png)

- The icon for the social media feed is in a square in the upper left corner of each post. 
- The block icon in the upper right corner would be where the messages are. Just an idea - still trying to figure how that feature would work - with all the platforms. I would really like to keep the design pretty simple and constant across the platform messages. 

### Social Media Feed [Option B]:

![](https://raw.githubusercontent.com/duliodenis/blox/master/design/images/4-SocialMediaFeed-B.png)

The social media blocks are closer together and the left side of the block has a color and a small icon for the social media platform. 

### Platform Specific Functionality

One of the items that we need to work out in the mock ups are what to do with the "likes, stars, hearts, etc" of each of the social media posts. We need to decide how to present platform specific interactions - how they could work.

### Side Menu Design

![](https://raw.githubusercontent.com/duliodenis/blox/master/design/images/5-SideMenu.png)

The side menu depicted here shows how a user could add/subtract social media accounts from their blox feed. This is where we can place the time block setting - the user changes their time block from here. 

### Support or Contact
Visit [ddApps.co](http://ddapps.co) to see more.
