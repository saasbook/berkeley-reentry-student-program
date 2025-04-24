# Berkeley ReEntry Student Program

[![build](https://github.com/cs169/berkeley-reentry-student-program/actions/workflows/main.yml/badge.svg)](https://github.com/cs169/berkeley-reentry-student-program/actions/workflows/main.yml)
[![rubocop](https://github.com/cs169/berkeley-reentry-student-program/actions/workflows/rubocop.yml/badge.svg)](https://github.com/cs169/berkeley-reentry-student-program/actions/workflows/rubocop.yml)
[![test coverage](https://api.codeclimate.com/v1/badges/c34db83045f2d3756e29/test_coverage)](https://codeclimate.com/github/cs169/berkeley-reentry-student-program/test_coverage)
[![maintainability](https://api.codeclimate.com/v1/badges/c34db83045f2d3756e29/maintainability)](https://codeclimate.com/github/cs169/berkeley-reentry-student-program/maintainability)
[![pivotal tracker](https://user-images.githubusercontent.com/67244883/154180887-f803124e-0156-4322-899d-ba475139d60d.png)](https://www.pivotaltracker.com/n/projects/2553425)

## Description
The Berkeley ReEntry Student Program is an application developed by UC Berkeley's CS169L students for the ReEntry Program at UC Berkeley. The application provides an easy-to-use interface for ReEntry students to sign-up for and use resources provided by UC Berkeley's ReEntry program.

## Project Status
**Working**
- Community space check-in
- Appointments
- Scholarships
- Courses
- Events

## Source/Golden Repo
This repo is forked from https://github.com/saasbook/berkeley-reentry-student-program

## Heroku Deployment

### Staging
https://sp25-03-reentry-181cb67be4ca.herokuapp.com/
### Production
https://reentry-student-program-b0fde1ef8035.herokuapp.com/


## First-Time Setup Instructions

1. Clone the repository locally and then make your own branch!!
2. Install Ruby version 3.2.7 and switch to that version
    - **For rvm**:
      - `rvm install 3.2.7`
      - `rvm use 3.2.7`
3. You must have PostgreSQL installed locally to run the rails server. 
    - **For Mac**:
      - Install PostgreSQL: `brew install postgresql`
      - Start PostgreSQL server: `brew services start postgresql`
    - **For Windows**: 
      - Install PostgreSQL: download installer from [postgresql.org](https://www.postgresql.org/download/windows/)
      - Start PostgreSQL server: `pg_ctl -D "C:\Program Files\PostgreSQL\9.6\data" start`
    - **For Linux**:
      - Install PostgreSQL: `sudo apt install postgresql postgresql-contrib`
      - Start PostgreSQL server: `sudo service postgresql start`
4. Install the dependencies using bundle
    - `bundle config set --local without 'production'`
    - `bundle install`
5. Setup the database 
    - `rake db:create && rake db:schema:load && rake db:migrate && rake db:seed`
6. Follow [these instructions](https://devcenter.heroku.com/articles/creating-apps) to create & setup a new Heroku app on the CLI
7. Add database to the Heroku app.
    - Go to the Resources page of your Heroku app.
    - Add Heroku Postgres as an add-on service.

## User Setup

Our code requires 4 environment variables to work correctly in production & local environments. 

**Local Development**: You must set a non-empty string for the environment variables `ADMIN`, `STAFF`, `GOOGLE_CLIENT_ID`, and `GOOGLE_CLIENT_SECRET`
  - **For Mac and Linux**: With Terminal open, run `open ~/.bash_profile`
    - **Note**: If you are using a different shell, add the following exports to the appropriate shell profile e.g. for zsh, run `open ~/.zshrc`
    - At the bottom of the text file, add the following: `export ADMINS=string` & `export STAFF=string` where string is a comma-separated list of Berkeley email addresses (these do not have to be real); i.e. `person@berkeley.edu,person2@berkeley.edu`
    - Additionally, add `export GOOGLE_CLIENT_ID=some_value` & `export GOOGLE_CLIENT_SECRET=some_value` where some_value is some arbitrary string (these do not need to be valid to run the app locally, since google authentication is stubbed-out unless it is run on production).
  - **For Windows**: follow [these instructions](https://devcenter.heroku.com/articles/creating-apps) to set environment variables 
      - Set  `ADMINS` & `STAFF`, where the value of each is a comma-separated list of Berkeley email addresses (these do not have to be real); i.e. `person@berkeley.edu,person2@berkeley.edu`.
      - Set `GOOGLE_CLIENT_ID` & `GOOGLE_CLIENT_SECRET` to some arbitrary string (these do not need to be valid to run the app locally, since google authentication is stubbed-out unless it is run on production).
  
**For Production**: Add the `ADMIN`, `STAFF`, `GOOGLE_CLIENT_ID`, and `GOOGLE_CLIENT_SECRET` environment variables to Heroku via the command line (assuming there is a Heroku app set up in your directory) 
  - Follow [these instructions](https://developers.google.com/adwords/api/docs/guides/authentication#webapp) (web app) to obtain a google client secret & a google client ID. For the callback URL, use https://*your-app-name*.herokuapp.com/auth/google_oauth2/
  - Use the command `heroku config:set VARIABLE=value` to set the environment variables.
  - Add `ADMINS` & `STAFF` set to a comma-separated list of verified administrators and staff members for the app. For testing purposes, these variables can both be set to the string `”none”`
  - Add `GOOGLE_CLIENT_SECRET` & `GOOGLE_CLIENT_ID` as provided by the instructions above.
  - **Note**: The environment variables can be manually entered in the Heroku app's Settings under "Config Vars".
  - Attach "Heroku Postgres" as an add-on to the Heroku app's Resource tab.
  - Using a terminal, run `heroku run rake db:schema:load` and `heroku run rake db:migrate` to load the database.
    - **Note**: If you do not have command-line access to run these commands, you can run rake commands directly in the Heroku app's console.

## Github Action

In order for the GitHub Actions build to pass, you must add a `CC_TEST_REPORTER_ID` as a repository secret on GitHub. To do this, first sign up for an account with codeclimate.com (quality, not velocity). Then, connect your repository and navigate to repo settings on the CodeClimate dashboard. Finally, copy the `test reporter ID` under the test coverage tab, and add it as a new repository secret under repository settings on GitHub. 


## RuboCop

RuboCop is a Ruby code style checker (linter) and formatter.
1. You can run `rubocop -a` to make safe fixes and `rubocop -A` to make unsafe auto-refactors.
2. You can also run `rubocop --auto-gen-config` to configure some finer settings.

## New Relic APM

New Relic APM is a monitoring service that monitors your apps performance. You can add the monitoring service on Heroku by going to the Resources page of your Heroku app.

## Canvas/Bcourse Authentication

The app relies on Canvas/Bcourse to authenticate users. If you are testing the authentication in a sandbox Canvas environment, you must have access to the sandbox environment to be able to authenticate. Request access to the sandbox environment from the professors.

**Authentication**

The Canvas URL and redirect URI are stored in the `config/credentials.yml.enc` file. If you click on the `Login with Canvas` button on the homepage and cancel the authentication, you will be redirected to the redirect URI stored in the `config/credentials.yml.enc` file. **For local testing, use the mock login instead and do not use the `Login with Canvas` button.**

**Mock Login/Authentication**

To make the mock authentication for Canvas visible and usable, add the following to your terminal profile to create a local environment variable:
- `export MOCK_CANVAS_LOGIN=true`

Setting the environment variable to false will disable the mock login. **Be sure to not set this environment variable to true in the production environment.**



## Credit
Spring 2025
- [Henry Wang](https://github.com/henwanfan)
- [Jeremy Richardson](https://github.com/WinbrosXP)
- [Kefeng Duan](https://github.com/mingyuyoooh)
- [Mandy Wong](https://github.com/mandywong0)
- [Sher Her](https://github.com/sherher21)
