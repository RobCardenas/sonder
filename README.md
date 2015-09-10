# Sonder

Heroku Link: [Sonder](http://s0nder.herokuapp.com)

# ![](https://s3.amazonaws.com/sonderr/defaults/s0nder-screenshot.jpg)

**Technologies used on this project:**

*Ruby on Rails
*Postgresql
*jQuery 
*Bootstrap

### User Narratives

Jane Doe and John Doe love to take pictures whenever they go out on an adventure but they rarely post more than one or two images on their other social media sites to avoid flooding their friend's feed. Sonder is a website where users can actually upload several images and narrate their adventures to the whole world. Visit Yosemite through the eyes of Alex Honnold or go into Brian Barczyk's snake dungeon by simple flipping through their stories. 

## Project Planning

First, the user narratives were written down and then I had to roughly visualize how I wanted the app to look. After all that was taken care of, the fun part begin. The models and the relationships were sketched out along with their corresponding methods and views. As it is, there's only three relationships but these will grow as more features are added.

## Downloading and running this repo

* Go to http://github.com/RobCardenas/sonder
* Clone the repo: git clone http://github.com/RobCardenas/sonder.git
* cd into sonder
* rake db:create
* rake db:migrate
* rails s
* You will need to create an Amazon S3 account in order to be able to upload images if you plan to host this online.
* Go to http://localhost:3000
* Boom, start uploading.