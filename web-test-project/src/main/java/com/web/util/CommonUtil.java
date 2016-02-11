package com.web.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import com.web.Dao.ProductsBatch;
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

	/**
	 * This method is used to read the data from excel file and insert into the
	 * list.
	 * 
	 * @param file
	 * @return stockList
	 */
	public static List<DtoStockExcelUpload> readExcelFile(File file) {
		List<DtoStockExcelUpload> stockList = new ArrayList<DtoStockExcelUpload>();
		List<ProductsBatch> daoList = new ArrayList<ProductsBatch>();
		try {
			FileInputStream inputStream = new FileInputStream(file);
			XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
			XSSFSheet sheet = workbook.getSheetAt(0);

			Iterator<Row> rowIterator = sheet.iterator();
			boolean skipHeader = false;
			while (rowIterator.hasNext()) {
				Row row = rowIterator.next();
				if (!skipHeader) {
					skipHeader = true;
					continue;
				} else {
					Iterator<Cell> cellIterator = row.cellIterator();
					int counter = 0;
					DtoStockExcelUpload dto = new DtoStockExcelUpload();
					// DAO Object
					ProductsBatch batch = new ProductsBatch();
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
							batch.setProductId(productId);
							break;
						case 1:
							dto.setProductName(cellVal);
							batch.setProductName(cellVal);
							break;
						case 2:
							Date manfDate = CommonUtil.dateFormat(cellVal);
							dto.setManfDate(manfDate);
							batch.setManfDate(manfDate);
							break;
						case 3:
							Date expDate = CommonUtil.dateFormat(cellVal);
							dto.setExpDate(expDate);
							batch.setExpiryDate(expDate);
							break;
						case 4:
							dto.setStatus(cellVal);
							batch.setStatus(cellVal);
							break;

						}
						counter++;
					}
					stockList.add(dto);
					daoList.add(batch);
				}
				inputStream.close();
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return stockList;
	}

	/**
	 * This method is used to convert the multipart file into file.
	 * 
	 * @param file
	 * @return convFile
	 * @throws IOException
	 */
	public static File convertMultipartToFile(MultipartFile file)
			throws IOException {
		File convFile = new File(file.getOriginalFilename());
		convFile.createNewFile();
		FileOutputStream fos = new FileOutputStream(convFile);
		fos.write(file.getBytes());
		fos.close();
		return convFile;
	}

	public static Set<DtoStockExcelUpload> relateCollectionData(
			List<DtoStockExcelUpload> dataList, Set<DtoStockExcelUpload> set) {
		Set<DtoStockExcelUpload> resultSet = new LinkedHashSet<DtoStockExcelUpload>();
		for (DtoStockExcelUpload setData : set) {
			int counter = 0;
			// DtoStockExcelUpload upload = new DtoStockExcelUpload();
			for (DtoStockExcelUpload listData : dataList) {
				if (setData.getProductId() == listData.getProductId()) {
					counter++;
				}
			}
			// Result Set
			setData.setProductWiseQuantity(counter);
			resultSet.add(setData);
		}
		return resultSet;
	}

}
