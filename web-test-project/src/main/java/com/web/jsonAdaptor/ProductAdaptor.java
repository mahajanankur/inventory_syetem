/**
 * 
 */
package com.web.jsonAdaptor;

import java.lang.reflect.Type;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import com.web.Dao.Products;

/**
 * @author ankur
 * 
 */
public class ProductAdaptor implements JsonSerializer<Products> {

	/*
	 * This method changes product to json format for getProductList() method of
	 * controller.
	 */
	@Override
	public JsonElement serialize(Products product, Type type,
			JsonSerializationContext context) {
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("pId", product.getProductId());
		jsonObject.addProperty("pName", product.getProductName());
		// jsonObject.addProperty("brand", product.getProductBrand());
		// jsonObject.addProperty("offer", product.getProductOffer());
		// jsonObject.addProperty("photo", product.getProductPhotos());
		// jsonObject.addProperty("categoryId", product.getCategoryId());
		// jsonObject.addProperty("price", product.getProductPrice());
		// jsonObject.addProperty("subCatId", product.getSubCategoryId());
		// jsonObject.addProperty("userId", product.getUserId());
		// jsonObject.addProperty("createdOn",
		// product.getCreatedOn().toString());
		// jsonObject.addProperty("specificationId", product
		// .getProductSpecifications().getSpecificationId());
		// jsonObject.addProperty("specificationDetails", product
		// .getProductSpecifications().getSpecificationsDetail());

		return jsonObject;
	}

}
