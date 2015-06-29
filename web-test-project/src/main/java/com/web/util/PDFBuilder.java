package com.web.util;

import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.web.Dao.InvoiceDetail;

/**
 * This view class generates a PDF document 'on the fly' based on the data
 * contained in the model.
 * 
 * @author www.codejava.net
 * 
 */
public class PDFBuilder extends AbstractITextPdfView {

	@SuppressWarnings("unchecked")
	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc,
			PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// get data model which is passed by the Spring container
		Set<InvoiceDetail> iDetail = (Set<InvoiceDetail>) model
				.get("invoiceDetail");

		doc.add(new Paragraph("Invoice Details"));

		PdfPTable table = new PdfPTable(4);
		table.setWidthPercentage(100.0f);
		table.setWidths(new float[] { 3.0f, 3.0f, 2.0f, 2.0f });
		table.setSpacingBefore(10);

		// define font for table header row
		Font font = FontFactory.getFont(FontFactory.HELVETICA);
		font.setColor(BaseColor.WHITE);

		// define table header cell
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(BaseColor.BLUE);
		cell.setPadding(4);

		// write table header
		cell.setPhrase(new Phrase("Client Name", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Product", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Quantity", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Price", font));
		table.addCell(cell);

		// write table row data
		double totalPrice = 0;
		for (InvoiceDetail detail : iDetail) {
			table.addCell(detail.getClientName());
			table.addCell(detail.getProductName());
			table.addCell(String.valueOf(detail.getQuantity()));
			table.addCell(String.valueOf(detail.getPrice()));
			totalPrice += detail.getPrice();
		}

		doc.add(table);
		doc.add(new Paragraph("Total Amount Without Applying Any Taxes :"
				+ totalPrice));
	}

}