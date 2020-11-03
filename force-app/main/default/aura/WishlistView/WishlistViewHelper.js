({
	getWishlistHelper : function(component) {
		let action = component.get("c.getWishlist");
        action.setCallback(this, function(response) {
            if (response.getState() === "SUCCESS") {
                component.set("v.wishlist", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	},
    
    getServicesHelper : function(component) {
        let action = component.get("c.getServices");
        action.setCallback(this, function(response) {
            if (response.getState() === "SUCCESS") {
                component.set("v.services", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})