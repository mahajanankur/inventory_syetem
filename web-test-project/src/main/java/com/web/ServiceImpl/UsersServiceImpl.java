package com.web.ServiceImpl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.Dao.Clients;
import com.web.Dao.Invoice;
import com.web.Dao.InvoiceDetail;
import com.web.Dao.ProductCategory;
import com.web.Dao.ProductSpecifications;
import com.web.Dao.ProductWiseStock;
import com.web.Dao.Products;
import com.web.Dao.Stock;
import com.web.Dao.SubProductCategory;
import com.web.Dao.Transaction;
import com.web.Dao.Users;
import com.web.Dao.VendorProducts;
import com.web.Dao.Vendors;
import com.web.dto.DtoInvoice;

/**
 * @author ankur
 * 
 */
public class UsersServiceImpl {

	@Autowired
	private EntityManagerFactory	entityManager;

	/**
	 * This method is used to find the user details with the user id.
	 * 
	 * @param id
	 * @return user
	 */
	public Users findUserById(String id) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();

		Users user = em.find(Users.class, id);

		em.close();
		return user;
	}

	/**
	 * This method is used to get all the users present in the DB.
	 * 
	 * @return userList
	 */
	@SuppressWarnings("unchecked")
	public List<Users> getUserList() {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createNamedQuery("users", Users.class);
		List<Users> userList = query.getResultList();
		em.close();
		return userList;

	}

	/**
	 * This method is used to create the product category.
	 * 
	 * @param categoryId
	 * @param categoryName
	 * @param userId
	 * @return success message
	 */
	public String createProductCategory(String categoryName, int userId) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();

		ProductCategory category = new ProductCategory();
		// category.setpCatrgoryId(categoryId);
		category.setpCategoryName(categoryName);
		category.setUserId(userId);

		em.persist(category);
		em.getTransaction().commit();
		em.close();

		return "category has been created successfully.";
	}

	/**
	 * This method is used to get all the product categories present in DB.
	 * 
	 * @return categoryList
	 */
	@SuppressWarnings("unchecked")
	public List<ProductCategory> getProductCategoryList() {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createNamedQuery("productCategory",
				ProductCategory.class);
		List<ProductCategory> categoryList = query.getResultList();
		em.close();
		return categoryList;
	}

	/**
	 * This method is used to remove the product category.
	 * 
	 * @param pCatId
	 * @return success message
	 */
	public String removeProductCategory(int pCatId) {

		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();

		ProductCategory productCategory = em
				.find(ProductCategory.class, pCatId);
		em.remove(productCategory);
		em.getTransaction().commit();
		em.close();

		return "The product category has been removed successfully.";
	}

	/**
	 * This method is used to find product category details.
	 * 
	 * @param pCatId
	 * @return category
	 */
	public ProductCategory findProductCategoryById(int pCatId) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		ProductCategory category = em.find(ProductCategory.class, pCatId);
		em.close();
		return category;
	}

	/**
	 * This method is used to create sub category.
	 * 
	 * @param catId
	 * @param userId
	 * @param subCatName
	 * @return success message
	 */
	public String createSubCategory(int catId, int userId, String subCatName) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();

		SubProductCategory category = new SubProductCategory();
		category.setCategoryId(catId);
		category.setSubCategoryName(subCatName);
		category.setUserId(userId);

		em.persist(category);
		em.getTransaction().commit();
		em.close();

		return "has been created successfully.";
	}

	/**
	 * This method is used to get sub product category list liked to a category
	 * by category id.
	 * 
	 * @param catId
	 * @return subCategoryList
	 */
	@SuppressWarnings("unchecked")
	public List<SubProductCategory> findSubProductCategoriesLinkedToACategory(
			int catId) {

		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createNamedQuery("subProductCategoryLinkedToACatId",
				SubProductCategory.class);
		query.setParameter("catId", catId);

		List<SubProductCategory> subCategoryList = query.getResultList();
		em.close();

		return subCategoryList;

	}

	/**
	 * This method is used to create product with the specifications.
	 * 
	 * @param catId
	 * @param subCatId
	 * @param subCatId2
	 * @param productName
	 * @param brand
	 * @param price
	 * @param offer
	 * @param photos
	 * @param specifications
	 * @param quantity
	 * @param sPrice
	 * @return successMessage
	 */
	public String createProduct(int userId, int catId, int subCatId,
			String productName, String brand, double cPrice, String offer,
			String photos, String specifications, int quantity, double sPrice) {

		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();

		Products products = new Products();
		ProductSpecifications pSpecification = new ProductSpecifications();
		pSpecification.setSpecificationsDetail(specifications);

		products.setCategoryId(catId);
		products.setSubCategoryId(subCatId);
		products.setProductName(productName);
		products.setProductBrand(brand);
		products.setCostPrice(cPrice);
		products.setSalePrice(sPrice);
		products.setQuantity(quantity);
		products.setProductOffer(offer);
		products.setProductPhotos(photos);
		products.setUserId(userId);
		products.setProductSpecifications(pSpecification);

		em.persist(products);
		em.getTransaction().commit();
		em.close();

		return "Product has been created successfully.";
	}

	/**
	 * This method is used to get all the products and its specifications linked
	 * to a sub category.
	 * 
	 * @param subCatId
	 * @return productList
	 */
	@SuppressWarnings("unchecked")
	public List<Products> getProductListBySubCategoryId(int subCatId) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createNamedQuery("productListBySubCatId",
				Products.class);
		query.setParameter("subCatId", subCatId);

		List<Products> productList = query.getResultList();
		em.close();

		return productList;
	}

	/**
	 * This method is used to get sub category details by id.
	 * 
	 * @param subCatId
	 * @return category
	 */
	public SubProductCategory findSubProductCategoryDetailsById(int subCatId) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();

		SubProductCategory category = em.find(SubProductCategory.class,
				subCatId);

		em.close();
		return category;
	}

	/**
	 * This method is used to get product details by id.
	 * 
	 * @param productId
	 * @return product
	 */
	public Products findProductById(int productId) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();

		Products product = em.find(Products.class, productId);

		em.close();
		return product;
	}

	/**
	 * This method is used to create a client.
	 * 
	 * @param clientName
	 * @param email
	 * @param mobile
	 * @param address
	 * @param pincode
	 * @param userId
	 * @param balance
	 * @return successMessage
	 */
	public String createClient(String clientName, String email, String mobile,
			String address, String pincode, int userId, double balance) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();

		Clients client = new Clients();
		client.setClientName(clientName);
		client.setAddress(address);
		client.setEmail(email);
		client.setBalance(balance);
		client.setMobile(mobile);
		client.setPincode(pincode);
		client.setUserId(userId);

		em.persist(client);
		em.getTransaction().commit();
		em.close();
		return "has created successfully.";
	}

	/**
	 * This method is used to get the client list.
	 * 
	 * @return clientList
	 */
	@SuppressWarnings("unchecked")
	public List<Clients> getClientList() {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNamedQuery("clientList", Clients.class);
		List<Clients> clientList = query.getResultList();
		em.close();
		return clientList;
	}

	/**
	 * This method is user to get clients details by client id.
	 * 
	 * @param clientId
	 * @return client
	 */
	public Clients findClientDetailsById(int clientId) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		Clients client = em.find(Clients.class, clientId);
		em.close();
		return client;
	}

	/**
	 * This method is used to remove the clients by client id.
	 * 
	 * @param clientId
	 * @return success message
	 */
	public String removeClientById(int clientId) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		Clients client = em.find(Clients.class, clientId);
		em.remove(client);
		em.getTransaction().commit();
		em.close();
		return "This client has been removed successfully.";
	}

	/**
	 * This method is used to get the sub category list.
	 * 
	 * @return subCatList
	 */
	@SuppressWarnings("unchecked")
	public List<SubProductCategory> getSubCategoryList() {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNamedQuery("subProductCategoryList",
				SubProductCategory.class);
		List<SubProductCategory> subCatList = query.getResultList();
		em.close();
		return subCatList;

	}

	/**
	 * This method is used to get the product list.
	 * 
	 * @return productList
	 */
	@SuppressWarnings("unchecked")
	public List<Products> getProductList() {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNamedQuery("productList", Products.class);
		List<Products> productList = query.getResultList();
		em.close();
		return productList;
	}

	/**
	 * This method is used to get all the transaction linked to a client.
	 * 
	 * @param clientId
	 * @return transactionList
	 */
	@SuppressWarnings("unchecked")
	public List<Transaction> getTransactionsLinkedToAClient(int clientId) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createNamedQuery("transactionsByClient",
				Transaction.class);
		query.setParameter("clientId", clientId);

		List<Transaction> transactionList = query.getResultList();
		em.close();
		return transactionList;
	}

	/**
	 * This method is used to create a transaction.
	 * 
	 * @param catId
	 * @param clientId
	 * @param clientName
	 * @param subCatId
	 * @param productId
	 * @param quantity
	 * @param amount
	 * @param userId
	 * @param productName
	 * @param afterBal
	 * @return successMessage
	 */
	public String createTransaction(int catId, int clientId, String clientName,
			int subCatId, int productId, int quantity, double amount,
			int userId, String productName, double afterBal) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		String message = null;
		// update product's quantity and soldQuantity according to transaction's
		// quantity.
		Products product = em.find(Products.class, productId);
		// product's quantity gets decrease according to transaction's quantity.
		int oldQuantity = product.getQuantity();
		// only allow transactions if stock is present.
		if (oldQuantity >= quantity) {
			int newQuantity = oldQuantity - quantity;
			// product's soldQuantity gets increase according to transaction's
			// quantity.
			int oldSoldQuantity = product.getSoldQuantity();
			int newSoldQuantity = oldSoldQuantity + quantity;
			product.setQuantity(newQuantity);
			product.setSoldQuantity(newSoldQuantity);

			// transaction table
			Transaction transaction = new Transaction();

			transaction.setCategoryId(catId);
			transaction.setClientId(clientId);
			// set product details as transaction and products are having
			// ManyToOne relationship.
			transaction.setProduct(product);
			transaction.setQuantity(quantity);
			transaction.setSubCatId(subCatId);
			transaction.settAmount(amount);
			transaction.setClientName(clientName);
			transaction.setUserId(userId);
			transaction.setProductName(productName);

			// update client balance according to transaction.
			Clients client = em.find(Clients.class, clientId);
			client.setBalance(afterBal);

			em.persist(transaction);
			em.getTransaction().commit();
			message = "Transaction has been created successfully.";
		} else {
			message = "There is no enough stock present.";
		}
		em.close();

		return message;
	}

	/**
	 * This method is used to get all the transactions.
	 * 
	 * @return transactionList
	 */
	@SuppressWarnings("unchecked")
	public List<Transaction> getTransactionList() {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNamedQuery("transactionList", Transaction.class);
		List<Transaction> transactionList = query.getResultList();
		em.close();
		return transactionList;
	}

	/**
	 * This method is used to update the client details according to request.
	 * 
	 * @param clientId
	 * @param address
	 * @param balance
	 * @param clientName
	 * @param createdOn
	 * @param email
	 * @param mobile
	 * @param pincode
	 * @param userId
	 * @return successMessage
	 */
	public String updateClientById(int clientId, String address,
			Double balance, String clientName, Timestamp createdOn,
			String email, String mobile, String pincode, Integer userId) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		// client details by id.
		Clients client = em.find(Clients.class, clientId);
		// update values according to the request.
		if (address != null && !address.equals("")) {
			client.setAddress(address);
		}
		if (balance != null) {
			client.setBalance(balance);
		}
		if (clientName != null && !clientName.equals("")) {
			client.setClientName(clientName);
		}
		if (createdOn != null && !createdOn.equals("")) {
			client.setCreatedOn(createdOn);
		}
		if (email != null && !email.equals("")) {
			client.setEmail(email);
		}
		if (mobile != null && !mobile.equals("")) {
			client.setMobile(mobile);
		}
		if (pincode != null && !pincode.equals("")) {
			client.setPincode(pincode);
		}
		if (userId != null) {
			client.setUserId(userId);
		}

		em.getTransaction().commit();
		em.close();

		return "Client has been updated successfully.";
	}

	/**
	 * This method is used to get the stock list.
	 * 
	 * @return stockList
	 */
	@SuppressWarnings("unchecked")
	public List<Stock> getStockList() {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNamedQuery("stockList", Stock.class);
		List<Stock> stockList = query.getResultList();

		em.close();

		return stockList;
	}

	/**
	 * This method is used to create stock and also it will update the quantity
	 * field in product table according to new stock.
	 * 
	 * @param vendorId
	 * @param stockName
	 * @param quantity
	 * @param userId
	 * @return success message
	 */
	public String createStock(int vendorId, String stockName, int quantity,
			int userId) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		// to update quantity in product table.
		// boolean fromCreateStock = true;
		// CHECK THIS !!!!

		// this.updateProductById(productId, null, null, null, null, null, null,
		// null, null, quantity, null, fromCreateStock, null, null);
		// for stock table
		Stock stock = new Stock();

		stock.setVendorId(vendorId);
		stock.setStockName(stockName);
		stock.setStockIn(quantity);
		stock.setUserId(userId);

		em.persist(stock);
		em.getTransaction().commit();
		em.close();

		return "Stock entry is successfull.";
	}

	/**
	 * This method is used to update the product according to the request.
	 * 
	 * @param pId
	 * @param catId
	 * @param subCatId
	 * @param pName
	 * @param brand
	 * @param price
	 * @param offer
	 * @param photos
	 * @param specifications
	 * @param quantity
	 * @param userId
	 * @param fromCreateStock
	 * @param soldQuantity
	 * @return successMessage
	 */
	public String updateProductById(int pId, Integer catId, Integer subCatId,
			String pName, String brand, Double cPrice, String offer,
			String photos, String specifications, Integer quantity,
			Integer userId, boolean fromCreateStock, Integer soldQuantity,
			Double sPrice) {

		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		// get Product details by id.
		Products product = em.find(Products.class, pId);
		// update values according to the request.
		if (catId != null) {
			product.setCategoryId(catId);
		}
		if (subCatId != null) {
			product.setSubCategoryId(subCatId);
		}
		if (pName != null && !pName.equals("")) {
			product.setProductName(pName);
		}
		if (brand != null && !brand.equals("")) {
			product.setProductBrand(brand);
		}
		if (cPrice != null) {
			product.setCostPrice(cPrice);
		}
		if (sPrice != null) {
			product.setSalePrice(sPrice);
		}
		if (offer != null && !offer.equals("")) {
			product.setProductOffer(offer);
		}
		if (photos != null && !photos.equals("")) {
			product.setProductPhotos(photos);
		}
		if (specifications != null && !specifications.equals("")) {
			product.getProductSpecifications().setSpecificationsDetail(
					specifications);
		}
		// update values according to the stock coming -- fromCreateStock is
		// true if this method is call from createStock() .
		if (fromCreateStock) {
			if (quantity != null) {
				int oldQuantity = product.getQuantity();
				int newQantity = oldQuantity + quantity;
				product.setQuantity(newQantity);
			}
		} else {
			if (quantity != null) {
				product.setQuantity(quantity);
			}
		}
		// updated when transaction is done.
		if (soldQuantity != null) {
			product.setSoldQuantity(soldQuantity);
		}
		if (userId != null) {
			product.setUserId(userId);
		}

		em.getTransaction().commit();
		em.close();

		return "Product has been updated successfully.";
	}

	/**
	 * This method is used to get the product list according to the quantity
	 * range.Only products having quantity less than the "quantityRange" are
	 * returned.
	 * 
	 * @param quantityRange
	 * @return productList
	 */
	@SuppressWarnings("unchecked")
	public List<Products> getProductListByQuantity(int quantityRange) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNamedQuery("productListByQuantity",
				Products.class);
		query.setParameter("lQuantity", quantityRange);
		List<Products> productList = query.getResultList();
		em.close();
		return productList;
	}

	/**
	 * This method is used to create vendor.
	 * 
	 * @param company
	 * @param email
	 * @param mobile
	 * @param address
	 * @param pincode
	 * @param userId
	 * @return successMessage
	 */
	public String createVendor(String company, String email, String mobile,
			String address, String pincode, int userId) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();

		Vendors vendor = new Vendors();
		vendor.setCompany(company);
		vendor.setEmail(email);
		vendor.setMobile(mobile);
		vendor.setAddress(address);
		vendor.setPincode(pincode);
		vendor.setUserId(userId);

		em.persist(vendor);
		em.getTransaction().commit();
		em.close();

		return "Vendor is created successfully.";
	}

	/**
	 * This method is used to get the vendors list.
	 * 
	 * @return vendor List
	 */
	@SuppressWarnings("unchecked")
	public List<Vendors> getVendorList() {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNamedQuery("vendorList", Vendors.class);
		List<Vendors> vList = query.getResultList();
		em.close();
		return vList;
	}

	/**
	 * This method is used to get vendor details by id.
	 * 
	 * @param vendorId
	 * @return vendor details
	 */
	public Vendors findVendorById(int vendorId) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		Vendors vendor = em.find(Vendors.class, vendorId);
		em.close();
		return vendor;
	}

	/**
	 * This method is used to link a vendor to different products.
	 * 
	 * @param vendorId
	 * @param company
	 * @param pId
	 * @param pName
	 * @return success message
	 */
	public String createProductsForVendor(int vendorId, String company,
			int pId, String pName) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		VendorProducts vp = new VendorProducts();
		vp.setCompany(company);
		vp.setProductId(pId);
		vp.setProductName(pName);
		vp.setVendorId(vendorId);

		em.persist(vp);
		em.getTransaction().commit();
		em.close();
		return "Products has been linked to the '" + company
				+ "' successfully.";
	}

	/**
	 * This method used to get all the products linked to a vendor.
	 * 
	 * @param vendorId
	 * @return vpList
	 */
	@SuppressWarnings("unchecked")
	public List<VendorProducts> getProductsLinkedToVendor(int vendorId) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNamedQuery("vendorProductsList",
				VendorProducts.class);
		query.setParameter("vendorId", vendorId);
		List<VendorProducts> vpList = query.getResultList();
		em.close();
		return vpList;
	}

	/**
	 * This method is used to create the invoice, two tables are linked to each
	 * other with One to many mapping for this function.
	 * 
	 * @param iList
	 * @return success message
	 */
	public String createInvoice(ArrayList<DtoInvoice> iList) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		Invoice invoice = new Invoice();
		Set<InvoiceDetail> set = new HashSet<InvoiceDetail>();

		for (DtoInvoice dto : iList) {
			InvoiceDetail details = new InvoiceDetail();

			details.setClientId(Integer.parseInt(dto.getClientId()));
			details.setClientName(dto.getClientName());
			details.setPrice(Double.parseDouble(dto.getPrice()));
			details.setProductId(Integer.parseInt(dto.getProductId()));
			details.setProductName(dto.getProductName());
			details.setQuantity(Integer.parseInt(dto.getQuantity()));

			set.add(details);

		}
		invoice.setInvoiceDetail(set);

		em.persist(invoice);
		em.getTransaction().commit();
		em.close();

		return "Invoice details are saved successfully.";
	}

	/**
	 * This method is used to update the product category details. But only the
	 * name, not user id.
	 * 
	 * @param catId
	 * @param catName
	 * @return success message
	 */
	public String updateProductCategory(int catId, String catName) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		ProductCategory category = em.find(ProductCategory.class, catId);
		category.setpCategoryName(catName);
		em.getTransaction().commit();
		em.close();

		return "Product category has been updated successfully.";
	}

	/**
	 * This method is used get all the invoices.
	 * 
	 * @return invoiceList
	 */
	@SuppressWarnings("unchecked")
	public List<Invoice> getInvoiceList() {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNamedQuery("invoiceList", Invoice.class);
		List<Invoice> invoiceList = query.getResultList();
		em.close();
		return invoiceList;
	}

	/**
	 * This method is used to get invoice details by invoice id.
	 * 
	 * @param invoiceId
	 * @return invoice
	 */
	public Invoice findInvoiceById(int invoiceId) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		Invoice invoice = em.find(Invoice.class, invoiceId);
		em.close();

		return invoice;
	}

	/**
	 * This method is used to get the sum of cost price of the products sold
	 * between a particular date range.
	 * 
	 * @param dFrom
	 * @param dTo
	 * @return cpSum
	 */
	public double getSumOfCostPriceForDateRange(Date dFrom, Date dTo) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		// Query query = em.createNamedQuery("sumOfCostPrice"); -- also OK
		Query query = em.createNamedQuery("sumOfCostPrice", Double.class);
		query.setParameter("fromDate", dFrom);
		query.setParameter("toDate", dTo);
		Double cpSum = (Double) query.getSingleResult();
		em.close();

		return cpSum;
	}

	/**
	 * This method is used to get the sum of sale price of the products sold
	 * between a particular date range.
	 * 
	 * @param dFrom
	 * @param dTo
	 * @return spSum
	 */
	public double getSumOfSalePriceForDateRange(Date dFrom, Date dTo) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNamedQuery("sumOfSalePrice", Double.class);
		query.setParameter("fromDate", dFrom);
		query.setParameter("toDate", dTo);
		Double spSum = (Double) query.getSingleResult();
		em.close();

		return spSum;
	}

	/**
	 * This method is used to get the count of total products sold between a
	 * particular date range.
	 * 
	 * @param dFrom
	 * @param dTo
	 * @return totalSoldProduct
	 */
	public long getTotalSoldProductsForDateRange(Date dFrom, Date dTo) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNamedQuery("totalSoldProducts", Long.class);
		query.setParameter("fromDate", dFrom);
		query.setParameter("toDate", dTo);
		long totalSoldProduct = (Long) query.getSingleResult();
		em.close();

		return totalSoldProduct;
	}

	/**
	 * This method is used to get the details of the maximum sold product
	 * between a particular date range.
	 * 
	 * @param dFrom
	 * @param dTo
	 * @return productDetails
	 */
	public Object getMaximumSoldProductForDateRange(Date dFrom, Date dTo) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNamedQuery("maximumSoldProduct");
		query.setParameter("fromDate", dFrom);
		query.setParameter("toDate", dTo);
		Object productDetails = query.setMaxResults(1).getResultList();
		em.close();

		return productDetails;
	}

	/**
	 * This method is used to get the minimum sold product details between a
	 * particular date range.
	 * 
	 * @param dFrom
	 * @param dTo
	 * @return productDetails
	 */
	public Object getMinimumSoldProductForDateRange(Date dFrom, Date dTo) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNamedQuery("minimumSoldProduct");
		query.setParameter("fromDate", dFrom);
		query.setParameter("toDate", dTo);
		Object productDetails = query.setMaxResults(1).getResultList();
		em.close();

		return productDetails;
	}

	public Long getTotalStock() {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNamedQuery("totalStock", Long.class);
		Long totalStock = (Long) query.getSingleResult();
		em.close();

		return totalStock;
	}

	public Stock getStockByStockId(int stockId) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		Stock sDetails = em.find(Stock.class, stockId);
		em.close();
		return sDetails;
	}

	public String createProductWiseStock(int pId, String pName, int quantity,
			int vendorId, int stockId) {

		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();

		ProductWiseStock productWiseStock = new ProductWiseStock();
		productWiseStock.setProductId(pId);
		productWiseStock.setProductName(pName);
		productWiseStock.setPpQuantities(quantity);
		productWiseStock.setVendorId(vendorId);

		// /Stock object
		Stock stock = new Stock();
		stock.setStockId(stockId);
		productWiseStock.setStock(stock);
		em.persist(productWiseStock);
		em.getTransaction().commit();
		em.close();
		return "Product-Wise Stock entry has been created successfully.";
	}

}
