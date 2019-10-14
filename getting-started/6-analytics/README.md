# Add Klevu Analytics to the application

Klevu Analytics is mainly focused on improving search results.  

- **[Add Klevu Analytics with Shopify](/getting-started/6-analytics/shopify)**
- **[Add Klevu Analytics with BigCommerce](/getting-started/6-analytics/bigcommerce)**
- **[Add Klevu Analytics with Magento 2](/getting-started/6-analytics/magento2)**

The following code reference has two analytics functionalities. Klevu Analytics functionality can be added in place based on the data you want to capture.

**Term Analytics:**  

This functionality is for capturing search event data. In the code reference files, this functionality has been added on Quick Search and Search Result Landing Page. 
Below snippet illustrates the usage of this functionality.

```js
var termOptions = {
	term: "bags",
	totalResults: 100,
	typeOfQuery: "WILDCARD_AND"	
};
klevu.analyticsEvents.term(termOptions);
```

**Click Analytics:**  

This functionality is for capturing product click event. In the code reference file, this functionality has been added to capture details from Quick Search and Landing page products click.  
Below snippet illustrates the usage of this functionality.  

```js
var clickOptions = {
	term: "bags",
	productId: 40791907918,
	productName: "Voyage Yoga Bag",
	productUrl: "https://domain-name.com/products/voyage-yoga-bag"	
};
klevu.analyticsEvents.click(clickOptions);
```