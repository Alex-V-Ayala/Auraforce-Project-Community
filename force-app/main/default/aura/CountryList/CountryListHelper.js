({
    getChosenCountry : function(component, name) {
		let action = component.get("c.getCountry");
        action.setParams({
            name: name
        });
        action.setCallback(this, function(response) {
            if (response.getState() === "SUCCESS") {
                component.set("v.currentCountry", response.getReturnValue());
            } else {
                console.log('Failed inside of CountryListController.js(?)');
			}
        });
        $A.enqueueAction(action);
	},
    
    getChosenServices : function(component, name) {
        let action = component.get("c.getServices");
        action.setParams({
            name: name
        });
        action.setCallback(this, function(response) {
            if (response.getState() === "SUCCESS") {
                component.set("v.currentServices", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    
    addToWishlistHelper : function(component, event, country) {
        let action = component.get("c.insertToWishlist");
        action.setParams({
            country: country
        });
        $A.enqueueAction(action);
    },
    
    removeFromWishlistHelper : function(component, event, country) {
        let action = component.get("c.deleteFromWishlist");
        action.setParams({
            country: country
        });
        $A.enqueueAction(action);
    }
})