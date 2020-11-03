({
    doInit : function(component, event, helper) {
        let initCountry = ["Select Country to View Info", '', ''];
        let initService = ["Select Country to View Available Services"];
        component.set("v.currentCountry", initCountry);
        component.set("v.currentServices", initService);
    },
    
    getIndia : function(component, event, helper) {
		helper.getChosenCountry(component, 'India');
        helper.getChosenServices(component, 'India');
	},
    
    getSingapore : function(component, event, helper) {
        helper.getChosenCountry(component, 'Singapore');
        helper.getChosenServices(component, 'Singapore');
    },
     
    getGermany : function(component, event, helper) {
		helper.getChosenCountry(component, 'Germany');
        helper.getChosenServices(component, 'Germany');
	},
    
    getBrazil : function(component, event, helper) {
		helper.getChosenCountry(component, 'Brazil');
        helper.getChosenServices(component, 'Brazil');
	},
    
    addToWishlistController : function(component, event, helper) {
        let country = component.get('v.currentCountry[0]');
        helper.addToWishlistHelper(component, event, country);
    },
    
    removeFromWishlistController : function(component, event, helper) {
        let country = component.get('v.currentCountry[0]');
        helper.removeFromWishlistHelper(component, event, country);
    }
})