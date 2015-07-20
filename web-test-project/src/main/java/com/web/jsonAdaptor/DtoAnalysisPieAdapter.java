package com.web.jsonAdaptor;

import java.lang.reflect.Type;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import com.web.dto.DtoAnalysisPie;

// This class is used to convert the DtoAnalysisPie data in JSON format for pie chart.
public class DtoAnalysisPieAdapter implements JsonSerializer<DtoAnalysisPie> {

	@Override
	public JsonElement serialize(DtoAnalysisPie dto, Type typeOfSrc,
			JsonSerializationContext context) {
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("label", dto.getpName());
		jsonObject.addProperty("data", dto.getpCount());

		return jsonObject;
	}

}
