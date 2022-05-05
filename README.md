[![Bluejay Dashboard](https://img.shields.io/badge/Bluejay-Dashboard_)](http://dashboard.bluejay.governify.io/dashboard/script/dashboardLoader.js?dashboardURL=https://reporter.bluejay.governify.io/api/v4/dashboards/tpa-CS169L-22-GH-ryan-garay89_berkeley-reentry-student-program/main)

![build](https://github.com/ryan-garay89/berkeley-reentry-student-program/actions/workflows/main.yml/badge.svg)

<a href="https://codeclimate.com/github/ryan-garay89/berkeley-reentry-student-program/test_coverage"><img src="https://api.codeclimate.com/v1/badges/edec3c54a12ea7c8914c/test_coverage" /></a>

<a href="https://codeclimate.com/github/ryan-garay89/berkeley-reentry-student-program/maintainability"><img src="https://api.codeclimate.com/v1/badges/edec3c54a12ea7c8914c/maintainability" /></a>

<a href="https://www.pivotaltracker.com/n/projects/2553425"><img src="https://user-images.githubusercontent.com/67244883/154180887-f803124e-0156-4322-899d-ba475139d60d.png" /></a>

## First-Time Setup Instructions

1. Fork & clone the repository locally!
2. Install Ruby version 3.0.3, and switch to that version using `rvm use 3.0.3`
3. Run `bundle install --without production`
4. Run `db:schema:load` & `rake db:migrate`
5. Follow [these instructions](https://devcenter.heroku.com/articles/creating-apps) to create & setup a new Heroku app on the CLI
  - You must have PostgreSQL installed locally to run the rails server. Then, you must start the server via the command line
    - **For Mac**: Run `brew services start postgresql`
    - **For Windows**: Run `pg_ctl -D "C:\Program Files\PostgreSQL\9.6\data" start`
6. Our code requires 4 environment variables to work correctly in production & local environments. 
  - _For local development_: You must set a non-empty string for the environment variables `ADMIN`, `STAFF`, `GOOGLE_CLIENT_ID`, and `GOOGLE_CLIENT_SECRET
    - **For Mac**: With Terminal open, run `open ~/.bash_profile`
    - At the bottom of the text file, add the following: `export ADMINS=string` & `export STAFF=string` where string is a comma-separated list of Berkeley       email addresses (these do not have to be real); i.e. `person@berkeley.edu,person2@berkeley.edu`
      Additionally, add `export GOOGLE_CLIENT_ID=some_value` & `export GOOGLE_CLIENT_SECRET=some_value` where some_value is some arbitrary string (these do       not need to be valid to run the app locally, since google authentication is stubbed-out unless it is run on production).
    - **For Windows**: follow [these instructions](https://devcenter.heroku.com/articles/creating-apps) to set environment variables 
    - Set  `ADMINS` & `STAFF`, where the value of each is a comma-separated list of Berkeley email addresses (these do not have to be real); i.e.                 `person@berkeley.edu,person2@berkeley.edu`.
    - Set `GOOGLE_CLIENT_ID` & `GOOGLE_CLIENT_SECRET` to some arbitrary string (these do not need to be valid to run the app locally, since google               authentication is stubbed-out unless it is run on production).
  - _For production_: Add the above environment variables to Heroku via the command line (assuming there is a Heroku app set up in your directory) 
    - Follow [these instructions](https://developers.google.com/adwords/api/docs/guides/authentication#webapp) (web app) to obtain a google client secret & a google client ID. For the callback URL, use https://*your-app-name*.herokuapp.com/auth/google_oauth2/
    - Use the command `heroku config:set VARIABLE=value`
    - Add `ADMINS` & `STAFF` set to a comma-separated list of verified administrators and staff members for the app. For testing purposes, these variables       can both be set to the string `”none”`
    - Add `GOOGLE_CLIENT_SECRET` & `GOOGLE_CLIENT_ID` as provided by the instructions above. 
7. That’s all! The app should now run on your local environment and any Heroku apps created from the codebase. 
