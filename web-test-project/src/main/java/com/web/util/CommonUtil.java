package com.web.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.web.dto.DtoStockExcelUpload;

/**
 * @author Dream On
 * 
 */
public class CommonUtil {

	/**
	 * This method is used to split the photo's url string for a product.
	 * 
	 * @param photoURL
	 * @return photos
	 */
	public static String[] photoURLSplitter(String photoURL) {
		String[] photos = photoURL.split("\\|");
		return photos;
	}

	/**
	 * This method is used to convert a string to date in "MM/dd/yyyy" format.
	 * 
	 * @param s
	 * @return date
	 */
	public static Date dateFormat(String s) {
		DateFormat format = new SimpleDateFormat("MM/dd/yyyy");
		Date d = null;
		try {
			d = format.parse(s);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return d;
	}

	/**
	 * This method is used to convert a date to string in "MM/dd/yyyy" format.
	 * 
	 * @param s
	 * @return date
	 */
	public static String dateFormat(Date s) {
		DateFormat writeFormat = new SimpleDateFormat("MM/dd/yyyy");
		String d = writeFormat.format(s);
		return d;
	}

	public static List<DtoStockExcelUpload> readExcelFile(File file) {
		List<DtoStockExcelUpload> stockList = new ArrayList<DtoStockExcelUpload>();
		try {
			FileInputStream inputStream = new FileInputStream(file);
			XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
			XSSFSheet sheet = workbook.getSheetAt(0);

			Iterator<Row> rowIterator = sheet.iterator();
			while (rowIterator.hasNext()) {
				Row row = rowIterator.next();

				Iterator<Cell> cellIterator = row.cellIterator();
				int counter = 0;
				DtoStockExcelUpload dto = new DtoStockExcelUpload();
				while (cellIterator.hasNext()) {
					Cell cell = cellIterator.next();
					String cellVal = null;
					switch (cell.getCellType()) {
					case Cell.CELL_TYPE_NUMERIC:
						if (HSSFDateUtil.isCellDateFormatted(cell)) {
							cellVal = CommonUtil.dateFormat(cell
									.getDateCellValue());
						} else {
							cellVal = cell.getNumericCellValue() + "";
						}
						break;
					case Cell.CELL_TYPE_STRING:
						cellVal = cell.getStringCellValue() + "";
						break;
					}
					switch (counter) {
					case 0:
						Double pId = Double.parseDouble(cellVal);
						int productId = pId.intValue();
						dto.setProductId(productId);
						break;
					case 1:
						dto.setProductName(cellVal);
						break;
					case 2:
						Date manfDate = CommonUtil.dateFormat(cellVal);
						dto.setManfDate(manfDate);
						break;
					case 3:
						Date expDate = CommonUtil.dateFormat(cellVal);
						dto.setExpDate(expDate);
						break;
					case 4:
						dto.setStatus(cellVal);
						break;

					}
					counter++;
				}
				stockList.add(dto);
			}
			inputStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return stockList;
	}

}
