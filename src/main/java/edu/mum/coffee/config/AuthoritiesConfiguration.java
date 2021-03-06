package edu.mum.coffee.config;

public class AuthoritiesConfiguration {
	
	public static final String[] ANONYMOUS = new String[] {
												"/", 
												"/home", 
												"/index", 
												"/resources/css/*",
												"/resources/image/*",
												"/resources/image/ads/*",
												"/resources/js/*", 
												"/signup*", 
												"/rest/**"
											};
	public static final String[] ADMIN_AUTHORITIES = new String[] {
												"/product/action**",
												"/product/add",
												"/product/list",
												"/product/modify", 
									    		"/person/list",
									    		"/person/add",
									    		"/order/list",
									    		"/order/detail"
											};
	public static final String[] USER_AUTHORITIES = new String[] {
												"/person/changeInformation/**",
												"/product/addToCart**",
												"/order", 
												"/order/checkout"
											};
}
