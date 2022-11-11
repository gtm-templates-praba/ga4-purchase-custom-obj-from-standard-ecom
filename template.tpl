___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "categories": [
    "UTILITY",
    "TAG_MANAGEMENT"
  ],
  "version": 1,
  "securityGroups": [],
  "displayName": "GA4 Purchase Custom Object from Standard Ecommerce DataLayer",
  "description": "This template variable would convert the classic/standard e-commerce transaction data layer into a Custom Object that can be used in the GA4 event tag to send the purchase event.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "currencyCode",
    "displayName": "Currency",
    "simpleValueType": true,
    "help": "ISO Format - Only 1 value allowed",
    "valueHint": "Eg: USD, EUR, GBP",
    "alwaysInSummary": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const dataLayer = require('copyFromDataLayer');
const items = dataLayer('transactionProducts', 1);
const transaction_id = dataLayer('transactionId', 1);
const affiliation = dataLayer('transactionAffiliation', 1);
const value = dataLayer('transactionTotal', 1);
const tax = dataLayer('transactionTax', 1);
const shipping = dataLayer('transactionShipping', 1);
const currency = data.currencyCode;

var itemsArr = items.map(function (i) {
		return {
			item_name: i.name,
			item_id: i.sku,
			price: i.price,
			item_category: i.category,
			quantity: i.quantity,
		};
	});

var Obj = {
  currency: currency,
  transaction_id: transaction_id,
  affiliation: affiliation,
  tax: tax,
  shipping: shipping,
  value: value,
  items: itemsArr
};

return Obj;


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "transactionProducts.*"
              },
              {
                "type": 1,
                "string": "transactionId"
              },
              {
                "type": 1,
                "string": "transactionAffiliation"
              },
              {
                "type": 1,
                "string": "transactionTotal"
              },
              {
                "type": 1,
                "string": "transactionTax"
              },
              {
                "type": 1,
                "string": "transactionShipping"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 6/19/2022, 8:03:00 PM


