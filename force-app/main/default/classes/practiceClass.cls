public class practiceClass {

    public static void makeCallout(String country) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://restcountries.eu/rest/v2/name/' + country + '?fullText=true');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        List<Object> results = (List<Object>) JSON.deserializeUntyped(response.getBody());
        Map<String, Object> ct = (Map<String, Object>) results[0];
        
        
        system.debug(response.getStatusCode());
        system.debug(response.getBody());
        system.debug(results);
        system.debug(ct.get('capital'));
        
        
        
    }
    
}
/*
{alpha2Code=IN, 
 alpha3Code=IND, 
 altSpellings=(IN, Bhārat, Republic of India, Bharat Ganrajya),
 area=3287590.0, 
 borders=(AFG, BGD, BTN, MMR, CHN, NPL, PAK, LKA),
 callingCodes=(91),
 capital=New Delhi,
 cioc=IND,
 currencies=({code=INR, name=Indian rupee, symbol=₹}),
 demonym=Indian,
 ...}
*/