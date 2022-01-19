# Project Intent
This project is designed to work as a time tracker for FIRST robotics teams. Once installed, it can be displayed on a lab computer and students can sign in and out to track their hours. We suggest using a barcode/barcode scanner for the user id etc. It makes the sign in/out process very quick. (Hint: your local grocery store rewards card probably has one!)

This application is designed by FIRST Robotics Team 900 - the Zebracorns.

# Statistics/Reporting
Statistics reporting has been implemented in a series of graphs. 

The graphs availlable are:
Stats By Week:
<ul>
	<li>Total Hours Per School Per Week</li>
	<li>Average Hours Per Student Per School Per Week</li>
	<li>Total Hours Per Week</li>
	<li>Cumulative Hours</li>
</ul>
Stats By School:
<ul>
	<li>Total Hours Per School</li>
	<li>Average Hours Per Student Per School</li>
	<li>Number of Students Per School</li>
</ul>

# Forms
Forms allows you to add student requirements. They could be (but are not limited to) tool use forms, liability waivers, permission slips, or training on a specific machine. Anything which can have a "yes" or a "no" per student. 

# Installing/Running

#### Prerequisites 
* PostgreSQL
* Ruby on Rails 5.1.4

#### Heroku Setup
I suggest using [heroku](https://www.heroku.com/) to host it. It's free (as long as you use no more than 1 thread a month), it allows access from any computer, and has postgres and RoR installed by default.

To install on heroku:

1.  Pull from git run this command in the command line:
<blockquote> 
$ git clone [repository url] <br />
</blockquote>
Note: The repository url can be found on the side of the github page 

2.  Modify code/[settings](#changing-settings) to fit your needs
3.  [Push to Heroku](https://devcenter.heroku.com/articles/getting-started-with-ruby#deploy-the-app)
4.  Migrate the DB to Heroku: heroku run rake db:migrate


#### Install elsewhere
I highly suggest that you install it someplace with remote access. That way time requirements can be checked from anywhere.

1.  Install Ruby on Rails (I suggest http://rvm.io/)
2.  Install PostgreSQL (http://www.postgresql.org/)
3.  Pull down the code and set it up
<blockquote> 
$ git clone [repository url] <br />
$ cd timesheet <br />
$ bundle install <br />
</blockquote>
Note: The repository url can be found on the side of the github page

4. Modify code/[settings](#changing-settings) to fit your needs (you should probably modify config/database.yml to password protect your database)
5. Start the server
<blockquote>
$ rails server -p [port] -e production
</blockquote>
Note: This app uses the default rails server, you probably want to switch to thin, passenger or unicorn for better options and stability. Heroku has this by default <br />
Note: By default rails uses port 3000, that would make the url on a local machine localhost:3000 by default websites normally run on 80 (http) or 443 (https). Some machines don't allow servers open on these ports and Apache or custom routing tables can be used. 

# Misc. Features
## Messages
You can leave messages for students which will appear in both their profile and on the login page when they sign in/out. Several color options are available. Messages can be found under the "Users" menu
## Hour Exceptions
This allows students to enter their reasons for missing requirements, facilitating communication. Once the hours are made up, admins can mark them as such and the requirements pages will show the requirements as met. 

# Changing settings

There are some settings which can be changed to adapt this for your team.
These can be found in lib/constants.rb

The hour requirements settings can be overridden by creating year specific hour requirements in the App. You can find the links under "Timelogs > Hour Requirements"
If no value is put in one of those fields, it will assume there is no requirement for that attribute. 

### Timezone
> <dl>
> 	<dt>Description</dt>
> 	<dd>
> 		The time zone associated with the times. It will determine what times show up, when the end of the day is, etc.
> 	</dd>
> 	<dt>Variable</dt>
> 	<dd>
> 		self.TimeZone
> 	</dd>
> 	<dt>Default</dt>
> 	<dd>
> 		Eastern Standard Time
> 	</dd>
> 	<dt>Modification</dt>
> 	<dd>
> 		Change the string to one of the approved rails timezones. 
>		<ul>
> 		 	<li>To get the timezones, you can run the command rake time:zones:all (computer must have RoR installed)</li>
>   	  	<li> More info on getting timezone list: http://codedecoder.wordpress.com/2013/09/09/timezone-in-rails/</li>
>   	  	<li> Timezones are also listed below</li>
>		</ul>
> 	</dd>
> </dl>

### Last Out
> <dl>
> 	<dt>Description</dt>
> 	<dd>
> 		The last possible time to sign out for the day. If a record isn't signed out by then, only 1 minute is credited for the day.
> 	</dd>
> 	<dt>Variable</dt>
> 	<dd>
> 		DAY_END
> 	</dd>
> 	<dt>Default</dt>
> 	<dd>
> 		1 am
> 	</dd>
> 	<dt>Modification</dt>
> 	<dd>
> 		Change the 1 to correspond with the number of hours after midnight to cut off
> 	</dd>
> </dl>
	
### Build Season Meetings Required
> <dl>
> 	<dt>Description</dt>
> 	<dd>
> 		The minimum number of meetings required from a student during build season. This is used in the student view. Will show true/false >based on meeting the different criteria
> 	</dd>
> 	<dt>Variable</dt>
> 	<dd>
> 		BUILD_MEETINGS
> 	</dd>
> 	<dt>Default</dt>
> 	<dd>
> 		2 Meeting
> 	</dd>
> 	<dt>Modification</dt>
> 	<dd>
> 		Change the 2 to the number of meetings required
> 	</dd>
> </dl>
	
### Pre Season Meetings Required
> <dl>
> 	<dt>Description</dt>
> 	<dd>
> 		The minimum number of meetings required from a student during build season. This is used in the student view. Will show true/false >based on meeting the different criteria
> 	</dd>
> 	<dt>Variable</dt>
> 	<dd>
> 		PRE_MEETINGS
> 	</dd>
> 	<dt>Default</dt>
> 	<dd>
> 		1 Meeting
> 	</dd>
> 	<dt>Modification</dt>
> 	<dd>
> 		Change the 2 to the number of meetings required
> 	</dd>
> </dl>

### Default Login
> <dl>
> 	<dt>Description</dt>
> 	<dd>
> 		A signin email which shows only student login page. Allows a computer to be set up and not monitored without giving access to student data.
> 	</dd>
> 	<dt>Variable</dt>
> 	<dd>
> 		DEFAULT_LOGIN
> 	</dd>
> 	<dt>Default</dt>
> 	<dd>
> 		"signup@team900.org"
> 	</dd>
> 	<dt>Modification</dt>
> 	<dd>
> 		Change the string to the email of an account. (Must register account in system)
> 	</dd>
> </dl>

### Team Name
> <dl>
> 	<dt>Description</dt>
> 	<dd>
> 		The team's name.
> 	</dd>
> 	<dt>Variable</dt>
> 	<dd>
> 		TEAM_NAME
> 	</dd>
> 	<dt>Default</dt>
> 	<dd>
> 		"Zebracorns"
> 	</dd>
> 	<dt>Modification</dt>
> 	<dd>
> 		Change the string to the team name.
> 	</dd>
> </dl>

### Team Number
> <dl>
> 	<dt>Description</dt>
> 	<dd>
> 		A string representing the team's number. Shows up on the home screen. 
> 	</dd>
> 	<dt>Variable</dt>
> 	<dd>
> 		TEAM_NUMBER
> 	</dd>
> 	<dt>Default</dt>
> 	<dd>
> 		"900"
> 	</dd>
> 	<dt>Modification</dt>
> 	<dd>
> 		Change the string to representing the team's number. 
> 	</dd>
> </dl>

### School/Group Descripter
> <dl>
> 	<dt>Description</dt>
> 	<dd>
> 		A string representing the main "grouping" of students. Could be school, group, team, division, or any other descriptor your team uses.
> 	</dd>
> 	<dt>Variable</dt>
> 	<dd>
> 		SCHOOL_NAME_REPLACEMENT
> 	</dd>
> 	<dt>Default</dt>
> 	<dd>
> 		"School"
> 	</dd>
> 	<dt>Modification</dt>
> 	<dd>
> 		Change the string to representing the team's main organizational unit. 
> 	</dd>
> </dl>

### Freshman Hours
> <dl>
> 	<dt>Description</dt>
> 	<dd>
> 		An integer representing the required hours for freshman.
> 	</dd>
> 	<dt>Variable</dt>
> 	<dd>
> 		FRESHMAN_HOURS
> 	</dd>
> 	<dt>Default</dt>
> 	<dd>
> 		6
> 	</dd>
> 	<dt>Modification</dt>
> 	<dd>
> 		Change the integer to be your required hours for freshman.
> 	</dd>
> </dl>

### Sophomores Hours
> <dl>
> 	<dt>Description</dt>
> 	<dd>
> 		An integer representing the required hours for sophomores.
> 	</dd>
> 	<dt>Variable</dt>
> 	<dd>
> 		SOPHOMORE_HOURS
> 	</dd>
> 	<dt>Default</dt>
> 	<dd>
> 		8
> 	</dd>
> 	<dt>Modification</dt>
> 	<dd>
> 		Change the integer to be your required hours for sophomores.
> 	</dd>
> </dl>

### Junior Hours
> <dl>
> 	<dt>Description</dt>
> 	<dd>
> 		An integer representing the required hours for juniors.
> 	</dd>
> 	<dt>Variable</dt>
> 	<dd>
> 		JUNIOR_HOURS
> 	</dd>
> 	<dt>Default</dt>
> 	<dd>
> 		10
> 	</dd>
> 	<dt>Modification</dt>
> 	<dd>
> 		Change the integer to be your required hours for juniors.
> 	</dd>
> </dl>

### Senior Hours
> <dl>
> 	<dt>Description</dt>
> 	<dd>
> 		An integer representing the required hours for senior.
> 	</dd>
> 	<dt>Variable</dt>
> 	<dd>
> 		SENIOR_HOURS
> 	</dd>
> 	<dt>Default</dt>
> 	<dd>
> 		10
> 	</dd>
> 	<dt>Modification</dt>
> 	<dd>
> 		Change the integer to be your required hours for senior.
> 	</dd>
> </dl>

### Leadership Hours
> <dl>
> 	<dt>Description</dt>
> 	<dd>
> 		An integer representing the required hours for leadership students.
> 	</dd>
> 	<dt>Variable</dt>
> 	<dd>
> 		LEADERSHIP_HOURS
> 	</dd>
> 	<dt>Default</dt>
> 	<dd>
> 		15
> 	</dd>
> 	<dt>Modification</dt>
> 	<dd>
> 		Change the integer to be your required hours for leadership students.
> 	</dd>
> </dl>

### Preseason Hours
> <dl>
>   <dt>Description</dt>
>   <dd>
>     An integer representing the required hours for preseason.
>   </dd>
>   <dt>Variable</dt>
>   <dd>
>     PRE_HOURS
>   </dd>
>   <dt>Default</dt>
>   <dd>
>     25
>   </dd>
>   <dt>Modification</dt>
>   <dd>
>     Change the integer to be your required hours for preseason.
>   </dd>
> </dl>

### Build Season Maximum Flex Hours
> <dl>
>   <dt>Description</dt>
>   <dd>
>     The default number of flex hours given per year. If set to 0, these panels are hidden from students. Flex hours are hours which don't need to be made up, they can be used when students have tests, sickness, etc. They must be submitted before the week is over. 
>   </dd>
>   <dt>Variable</dt>
>   <dd>
>     FLEX_HOURS
>   </dd>
>   <dt>Default</dt>
>   <dd>
>     15 Hours
>   </dd>
>   <dt>Modification</dt>
>   <dd>
>     Change the 15 to the number of flex hours per year (0 to disable feature)
>   </dd>
> </dl>

# Initial Creation
You now need to be sure that you create "years" before a season starts. A year consists of a start date, end date, and build season start date. The time logs are associated with these years as are the statistics. 
