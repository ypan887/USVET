

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