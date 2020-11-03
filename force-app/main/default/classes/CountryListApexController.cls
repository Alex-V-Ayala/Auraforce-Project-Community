public with sharing class CountryListApexController {
    
    @AuraEnabled
    // gets all info from the chosen country
    public static List<String> getCountry(String name) {
    	// REST callout
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://restcountries.eu/rest/v2/name/' + name + '?fullText=true');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
    	// Parsing the JSON
        List<Object> results = (List<Object>) JSON.deserializeUntyped(response.getBody());
        Map<String, Object> country = (Map<String, Object>) results[0];
        
        // Further parsing the info and placing it into the countryStringInfo list
        List<Object> countryInfo = new List<Object>();
        List<String> countryStringInfo = new List<String>();
        countryInfo.add(country.get('name'));
        countryInfo.add(country.get('capital'));
        countryInfo.add(country.get('subregion'));
        countryInfo.add(country.get('population'));
        for (Object o : countryInfo) {
                countryStringInfo.add(String.valueOf(o));
        }
        
        // Parses the currency/ies and places it into the countryStringInfo list
        List<Object> currencyListv1 = (List<Object>) country.get('currencies');
        List<String> currencyStringList = new List<String>();
        String currencyString = '';
        for (Object curr : currencyListv1) {
            Map<String, Object> currentCurrency = (Map<String, Object>) curr;
            currencyStringList.add(String.valueOf(currentCurrency.get('name')));
        }
        for (Integer i = 0; i < currencyStringList.size(); i++) {
            if (i == currencyStringList.size() - 1) {
                currencyString = currencyString + currencyStringList[i];
            } else {
                currencyString = currencyString + currencyStringList[i] + ', ';
            } 
        }
        countryStringInfo.add(currencyString);
        
        // Parses the language(s) and places it into the countryStringInfo list
        List<Object> languageListv1 = (List<Object>) country.get('languages');
        List<String> languageStringList = new List<String>();
        String languageString = '';
        for (Object lang : languageListv1) {
            Map<String, Object> languageCurrency = (Map<String, Object>) lang;
            languageStringList.add(String.valueOf(languageCurrency.get('name')));
        }
        for (Integer i = 0; i < languageStringList.size(); i++) {
            if (i == languageStringList.size() - 1) {
                languageString = languageString + languageStringList[i];
            } else {
                languageString = languageString + languageStringList[i] + ', ';
            } 
        }
        countryStringInfo.add(languageString);
        
        return countryStringInfo;
    }
    
    @AuraEnabled
    public static List<String> getServices(String name) {
        List<Service__c> serviceList = [SELECT Name, Type__c
                                        FROM Service__c
                                        WHERE Countries__r.Name LIKE :name];
        List<String> returnList = new List<String>();
        
        for (Service__c s : serviceList) {
            returnList.add(s.Name);
        }
        return returnList;
    }
    
    @AuraEnabled
    public static void insertToWishlist(String country) {       
        if (country != 'Select Country to View Info') {
            List<Wishlist__c> testList = [SELECT Name
                                          FROM Wishlist__c
                                          WHERE Name LIKE :country];
            
            if (testList.size() < 1) {
				Wishlist__c newWishlist = new Wishlist__c();
        		newWishlist.Name = country;
        		insert newWishlist;
        	}
        }  
    }
    
    @AuraEnabled
    public static void deleteFromWishlist(String country) {
        if (country != 'Select Country to View Info') {
            List<Wishlist__c> testList = [SELECT Name FROM Wishlist__c WHERE Name LIKE :country];
        
        	if (testList.size() > 0) {
				delete testList;
        	}
        }
    }

}