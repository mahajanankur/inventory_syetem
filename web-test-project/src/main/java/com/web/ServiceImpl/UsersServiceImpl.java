package com.web.ServiceImpl;

import java.sql.Timestamp;
import java.util.ArrayList;
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
import com.web.Dao.Products;
import com.web.Dao.Stock;
import com.web.Dao.SubProductCategory;
import com.web.Dao.Transaction;
import com.web.Dao.Users;
import com.web.Dao.VendorProducts;
import com.web.Dao.Vendors;
import com.web.dto.DtoInvoice;

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
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();

		Users user = entityManager.find(Users.class, id);

		entityManager.close();
		return user;
	}

	/**
	 * This method is used to get all the users present in the DB.
	 * 
	 * @return userList
	 */
	@SuppressWarnings("unchecked")
	public List<Users> getUserList() {
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();

		Query query = entityManager.createNamedQuery("users", Users.class);
		List<Users> userList = query.getResultList();
		entityManager.close();
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
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();

		ProductCategory category = new ProductCategory();
		// category.setpCatrgoryId(categoryId);
		category.setpCategoryName(categoryName);
		category.setUserId(userId);

		entityManager.persist(category);
		entityManager.getTransaction().commit();
		entityManager.close();

		return "category has been created successfully.";
	}

	/**
	 * This method is used to get all the product categories present in DB.
	 * 
	 * @return categoryList
	 */
	@SuppressWarnings("unchecked")
	public List<ProductCategory> getProductCategoryList() {
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();

		Query query = entityManager.createNamedQuery("productCategory",
				ProductCategory.class);
		List<ProductCategory> categoryList = query.getResultList();
		entityManager.close();
		return categoryList;
	}

	/**
	 * This method is used to remove the product category.
	 * 
	 * @param pCatId
	 * @return success message
	 */
	public String removeProductCategory(int pCatId) {

		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();

		ProductCategory productCategory = entityManager.find(
				ProductCategory.class, pCatId);
		entityManager.remove(productCategory);
		entityManager.getTransaction().commit();
		entityManager.close();

		return "The product category has been removed successfully.";
	}

	/**
	 * This method is used to find product category details.
	 * 
	 * @param pCatId
	 * @return category
	 */
	public ProductCategory findProductCategoryById(int pCatId) {
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();
		ProductCategory category = entityManager.find(ProductCategory.class,
				pCatId);
		entityManager.close();
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
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();

		SubProductCategory category = new SubProductCategory();
		category.setCategoryId(catId);
		category.setSubCategoryName(subCatName);
		category.setUserId(userId);

		entityManager.persist(category);
		entityManager.getTransaction().commit();
		entityManager.close();

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

		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();

		Query query = entityManager.createNamedQuery(
				"subProductCategoryLinkedToACatId", SubProductCategory.class);
		query.setParameter("catId", catId);

		List<SubProductCategory> subCategoryList = query.getResultList();
		entityManager.close();

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

		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();

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

		entityManager.persist(products);
		entityManager.getTransaction().commit();
		entityManager.close();

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
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();

		Query query = entityManager.createNamedQuery("productListBySubCatId",
				Products.class);
		query.setParameter("subCatId", subCatId);

		List<Products> productList = query.getResultList();
		entityManager.close();

		return productList;
	}

	/**
	 * This method is used to get sub category details by id.
	 * 
	 * @param subCatId
	 * @return category
	 */
	public SubProductCategory findSubProductCategoryDetailsById(int subCatId) {
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();

		SubProductCategory category = entityManager.find(
				SubProductCategory.class, subCatId);

		entityManager.close();
		return category;
	}

	/**
	 * This method is used to get product details by id.
	 * 
	 * @param productId
	 * @return product
	 */
	public Products findProductById(int productId) {
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();

		Products product = entityManager.find(Products.class, productId);

		entityManager.close();
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
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();

		Clients client = new Clients();
		client.setClientName(clientName);
		client.setAddress(address);
		client.setEmail(email);
		client.setBalance(balance);
		client.setMobile(mobile);
		client.setPincode(pincode);
		client.setUserId(userId);

		entityManager.persist(client);
		entityManager.getTransaction().commit();
		entityManager.close();
		return "has created successfully.";
	}

	/**
	 * This method is used to get the client list.
	 * 
	 * @return clientList
	 */
	@SuppressWarnings("unchecked")
	public List<Clients> getClientList() {
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();
		Query query = entityManager.createNamedQuery("clientList",
				Clients.class);
		List<Clients> clientList = query.getResultList();
		entityManager.close();
		return clientList;
	}

	/**
	 * This method is user to get clients details by client id.
	 * 
	 * @param clientId
	 * @return client
	 */
	public Clients findClientDetailsById(int clientId) {
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();
		Clients client = entityManager.find(Clients.class, clientId);
		entityManager.close();
		return client;
	}

	/**
	 * This method is used to remove the clients by client id.
	 * 
	 * @param clientId
	 * @return success message
	 */
	public String removeClientById(int clientId) {
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();
		Clients client = entityManager.find(Clients.class, clientId);
		entityManager.remove(client);
		entityManager.getTransaction().commit();
		entityManager.close();
		return "This client has been removed successfully.";
	}

	/**
	 * This method is used to get the sub category list.
	 * 
	 * @return subCatList
	 */
	@SuppressWarnings("unchecked")
	public List<SubProductCategory> getSubCategoryList() {
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();
		Query query = entityManager.createNamedQuery("subProductCategoryList",
				SubProductCategory.class);
		List<SubProductCategory> subCatList = query.getResultList();
		entityManager.close();
		return subCatList;

	}

	/**
	 * This method is used to get the product list.
	 * 
	 * @return productList
	 */
	@SuppressWarnings("unchecked")
	public List<Products> getProductList() {
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();
		Query query = entityManager.createNamedQuery("productList",
				Products.class);
		List<Products> productList = query.getResultList();
		entityManager.close();
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
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();

		Query query = entityManager.createNamedQuery("transactionsByClient",
				Transaction.class);
		query.setParameter("clientId", clientId);

		List<Transaction> transactionList = query.getResultList();
		entityManager.close();
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
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();
		String message = null;
		// update product's quantity and soldQuantity according to transaction's
		// quantity.
		Products product = entityManager.find(Products.class, productId);
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
			transaction.setProductId(productId);
			transaction.setQuantity(quantity);
			transaction.setSubCatId(subCatId);
			transaction.settAmount(amount);
			transaction.setClientName(clientName);
			transaction.setUserId(userId);
			transaction.setProductName(productName);

			// update client balance according to transaction.
			Clients client = entityManager.find(Clients.class, clientId);
			client.setBalance(afterBal);

			entityManager.persist(transaction);
			entityManager.getTransaction().commit();
			message = "Transaction has been created successfully.";
		} else {
			message = "There is no enough stock present.";
		}
		entityManager.close();

		return message;
	}

	/**
	 * This method is used to get all the transactions.
	 * 
	 * @return transactionList
	 */
	@SuppressWarnings("unchecked")
	public List<Transaction> getTransactionList() {
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();
		Query query = entityManager.createNamedQuery("transactionList",
				Transaction.class);
		List<Transaction> transactionList = query.getResultList();
		entityManager.close();
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
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();
		// client details by id.
		Clients client = entityManager.find(Clients.class, clientId);
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

		entityManager.getTransaction().commit();
		entityManager.close();

		return "Client has been updated successfully.";
	}

	/**
	 * This method is used to get the stock list.
	 * 
	 * @return stockList
	 */
	@SuppressWarnings("unchecked")
	public List<Stock> getStockList() {
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();
		Query query = entityManager.createNamedQuery("stockList", Stock.class);
		List<Stock> stockList = query.getResultList();

		entityManager.close();

		return stockList;
	}

	/**
	 * This method is used to create stock and also it will update the quantity
	 * field in product table according to new stock.
	 * 
	 * @param catId
	 * @param subCatId
	 * @param productId
	 * @param productName
	 * @param quantity
	 * @return successMessage
	 */
	public String createStock(int catId, int subCatId, int productId,
			String productName, int quantity) {
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();
		// to update quantity in product table.
		boolean fromCreateStock = true;
		this.updateProductById(productId, null, null, null, null, null, null,
				null, null, quantity, null, fromCreateStock, null, null);
		// for stock table
		Stock stock = new Stock();

		stock.setCatId(catId);
		stock.setSubCatId(subCatId);
		stock.setProductId(productId);
		stock.setProductName(productName);
		stock.setStockIn(quantity);

		entityManager.persist(stock);
		entityManager.getTransaction().commit();
		entityManager.close();

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

		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();
		// get Product details by id.
		Products product = entityManager.find(Products.class, pId);
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

		entityManager.getTransaction().commit();
		entityManager.close();

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
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();
		Query query = entityManager.createNamedQuery("productListByQuantity",
				Products.class);
		query.setParameter("lQuantity", quantityRange);
		List<Products> productList = query.getResultList();
		entityManager.close();
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
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();

		Vendors vendor = new Vendors();
		vendor.setCompany(company);
		vendor.setEmail(email);
		vendor.setMobile(mobile);
		vendor.setAddress(address);
		vendor.setPincode(pincode);
		vendor.setUserId(userId);

		entityManager.persist(vendor);
		entityManager.getTransaction().commit();
		entityManager.close();

		return "Vendor is created successfully.";
	}

	/**
	 * This method is used to get the vendors list.
	 * 
	 * @return vendor List
	 */
	@SuppressWarnings("unchecked")
	public List<Vendors> getVendorList() {
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();
		Query query = entityManager.createNamedQuery("vendorList",
				Vendors.class);
		List<Vendors> vList = query.getResultList();
		entityManager.close();
		return vList;
	}

	/**
	 * This method is used to get vendor details by id.
	 * 
	 * @param vendorId
	 * @return vendor details
	 */
	public Vendors findVendorById(int vendorId) {
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();
		Vendors vendor = entityManager.find(Vendors.class, vendorId);
		entityManager.close();
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
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();
		VendorProducts vp = new VendorProducts();
		vp.setCompany(company);
		vp.setProductId(pId);
		vp.setProductName(pName);
		vp.setVendorId(vendorId);

		entityManager.persist(vp);
		entityManager.getTransaction().commit();
		entityManager.close();
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
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();
		Query query = entityManager.createNamedQuery("vendorProductsList",
				VendorProducts.class);
		query.setParameter("vendorId", vendorId);
		List<VendorProducts> vpList = query.getResultList();
		entityManager.close();
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
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();
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

		entityManager.persist(invoice);
		entityManager.getTransaction().commit();
		entityManager.close();

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
		EntityManager entityManager = this.entityManager.createEntityManager();
		entityManager.getTransaction().begin();
		ProductCategory category = entityManager.find(ProductCategory.class,
				catId);
		category.setpCategoryName(catName);
		entityManager.getTransaction().commit();
		entityManager.close();

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
}
