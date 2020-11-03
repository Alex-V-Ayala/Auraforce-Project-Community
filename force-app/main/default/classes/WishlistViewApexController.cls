public class WishlistViewApexController {
    
    public static List<Wishlist__c> wishlist = [SELECT Name FROM Wishlist__c];
    
    @AuraEnabled
    public static List<Wishlist__c> getWishlist() {
        return wishlist;
    }
    
    @AuraEnabled
    public static List<Service__c> getServices() {
        List<Service__c> serviceList = new List<Service__c>();
        for (Wishlist__c w : wishlist) {
            List<Service__c> loopList = [SELECT Name FROM Service__c
                                         WHERE Countries__r.Name LIKE :w.Name];
            for (Service__c s : loopList) {
                serviceList.add(s);
            }
        }
        system.debug(serviceList);
        for (Service__c s : serviceList) {
            system.debug(s.Name);
        }
        return serviceList;
    }
    
}