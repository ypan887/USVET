

## Setting up mail list

Create an mailchimp account and create an api key and list. Add the api key and list id to your server ENV variable with key "mailchimp_api_key" and "mailchimp_list_id, or create your own application.yml under /config folder and write the following

```
mailchimp_api_key: "your api key"
mailchimp_list_id: "your list id"
```

Or, if you are deploying to heroku:

```
$ heroku config:set mailchimp_api_key:"your api key" mailchimp_list_id:"your list id"
```


# Admin Console

## Creating a question
go to question tab, and create a question. Select base to true if this is the first question you want in the QA system.

## Create an answer
1. go to answer tab, and create an answer
2. view a question, and click add an answer to the question

Choose a next question if the answer leads to a new question. Otherwise, you can choose "no next question" and a editor will pop up so that you can create you answer page
