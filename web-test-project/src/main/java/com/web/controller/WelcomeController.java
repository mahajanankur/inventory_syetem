package com.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.web.Dao.Clients;
import com.web.Dao.Invoice;
import com.web.Dao.InvoiceDetail;
import com.web.Dao.ProductCategory;
import com.web.Dao.Products;
import com.web.Dao.Stock;
import com.web.Dao.SubProductCategory;
import com.web.Dao.Transaction;
import com.web.Dao.VendorProducts;
import com.web.Dao.Vendors;
import com.web.ServiceImpl.UsersServiceImpl;
import com.web.dto.DtoCustomUser;
import com.web.dto.DtoInvoice;
import com.web.jsonAdaptor.ProductAdaptor;
import com.web.util.CommonUtil;

/**
 * @author ankur
 * 
 */
@Controller
public class WelcomeController {

	@Autowired
	private UsersServiceImpl	serviceImpl;
	private String				redirectedURL;

	private static final Logger	logger	= LoggerFactory
												.getLogger(WelcomeController.class);

	// @RequestMapping(value = "/", method = RequestMethod.GET)
	// public String welcome() {
	// logger.debug("In welcome() method.");
	// // return "Login";
	//
	// return "redirect:/welcome";
	// }

	@RequestMapping(value = { "/", "/login" }, method = RequestMethod.GET)
	public String login() {
		logger.debug("In login() method.");
		return "Login";
		// TODO - this code is working fine.
		// return "forward:/nc/testMap";
	}

	/**
	 * This method will validate the username and password and redirect the page
	 * accordingly.
	 * 
	 * @param session
	 * @param username
	 * @param body
	 * @param pwd
	 * @return url
	 */
	// @RequestMapping(value = "/loginFormAction", method = RequestMethod.GET)
	// public String submit(HttpSession session,
	// @RequestParam(value = "username") String username,
	// @RequestParam(value = "password") String pwd) {
	//
	// int userId = 0;
	//
	// boolean loginSuccess = false;
	// List<Users> userList = serviceImpl.getUserList();
	// for (Users user : userList) {
	// if (user.getUsername().equals(username)
	// && user.getPassword().equals(pwd)) {
	// userId = user.getUserId();
	// loginSuccess = true;
	// break;
	// }
	// }
	//
	// if (loginSuccess) {
	// session.setAttribute("sessionId", userId);
	// session.setAttribute("username", username);
	//
	// redirectedURL = new String("home");
	//
	// } else {
	// redirectedURL = new String("login");
	// }
	// String url = "redirect:/" + redirectedURL;
	// return url;
	// }

	/**
	 * If login is successful, then page should redirect to Home page.
	 * 
	 * @param session
	 * @param model
	 * @return Home page
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String loginSuccess(HttpSession session, Model model) {

		System.out.println("On Home Page !!!");

		// getting Authentication details from spring security.

		String name = null;
		Set<GrantedAuthority> role = new HashSet<GrantedAuthority>();

		// check if user is login
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			// Get the user details
			DtoCustomUser userDetail = (DtoCustomUser) auth.getPrincipal();
			name = userDetail.getUsername();
			int id = userDetail.getUserId();
			role = (Set<GrantedAuthority>) userDetail.getAuthorities();
		}

		return "Home";
	}

	/**
	 * If login is unsuccessful, the page should redirect to same page(login)
	 * with a login fails message.
	 * 
	 * @param session
	 * @param model
	 * @return Login page
	 */
	@RequestMapping(value = "/loginFail", method = RequestMethod.GET)
	public String loginFail(HttpSession session, Model model) {

		System.out.println("Login Fails !!!");
		String failMsg = "Username or password is invalid.";
		model.addAttribute("failMsg", failMsg);
		return "Login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model) {

		System.out.println("Logout button clicked. !!!");
		String logoutMsg = "You've been logged out successfully.";
		model.addAttribute("failMsg", logoutMsg);
		return "Login";
	}

	/**
	 * This method is called when the button on home page
	 * (homePageFirstFormAction form action) is pressed.
	 * 
	 * @param session
	 * @param products
	 * @param remove
	 * @param clients
	 * @param check
	 * @return redirectedURL
	 */
	@RequestMapping(value = "/homePageFirstFormAction", method = RequestMethod.GET)
	public String home(
			HttpSession session,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "product_name", required = false, defaultValue = "") String products,
			@RequestParam(value = "transaction_name", required = false, defaultValue = "") String transactions,
			@RequestParam(value = "client_name", required = false, defaultValue = "") String clients,
			@RequestParam(value = "stock_name", required = false, defaultValue = "") String stock,
			@RequestParam(value = "vendor_name", required = false, defaultValue = "") String vendor,
			@RequestParam(value = "invoice_name", required = false) String invoice,
			@RequestParam(value = "analysis_name", required = false) String analysis) {

		String url = null;
		int sessionId = 0;
		if (products != null && products.equalsIgnoreCase("products")) {
			System.out.println("Products Button pressed !!!");
			sessionId = Integer.parseInt(session.getAttribute("sessionId")
					.toString());
			System.out.println(sessionId);
			url = "redirect:/createProductCategory";
		} else if (transactions != null
				&& transactions.equalsIgnoreCase("transactions")) {
			System.out.println("Transactions Button pressed !!!");
			sessionId = Integer.parseInt(session.getAttribute("sessionId")
					.toString());

			redirectAttributes.addAttribute("fromClient", false);
			redirectAttributes.addAttribute("clientId", 0);

			url = "redirect:/transactions";
		} else if (clients != null && clients.equalsIgnoreCase("clients")) {
			System.out.println("Clients Button pressed !!!");
			url = "redirect:/createClient";

		} else if (stock != null && stock.equalsIgnoreCase("stock")) {
			System.out.println("stock Button pressed !!!");
			url = "redirect:/stockList";
		} else if (vendor != null && vendor.equalsIgnoreCase("vendors")) {
			System.out.println("Vendors Button pressed !!!");
			url = "redirect:/vendorList";
		} else if (invoice != null && invoice.equalsIgnoreCase("invoice")) {
			System.out.println("Invoice Button pressed !!!");
			url = "redirect:/invoiceList";
		} else if (analysis != null && analysis.equalsIgnoreCase("analysis")) {
			System.out.println("Analysis Button pressed !!!");
			url = "redirect:/analysis";
		}
		return url;

	}

	/**
	 * This method is used to redirect us to the CreateProductCategory.jsp page.
	 * Use the same mapping as we declared in the "redirect:" parameter.
	 * 
	 * @param session
	 * @param model
	 * @return CreateProductCategory.jsp
	 */
	@RequestMapping(value = "/createProductCategory", method = RequestMethod.GET)
	public String redirectCreateProductCategory(
			HttpSession session,
			Model model,
			// redirected attributes from the pages from which it is redirected.
			@ModelAttribute(value = "redirectAttribute") String redirectAttribute,
			@ModelAttribute(value = "popUpMessage") String popUpMessage) {
		System.out.println("On Create Page !!!");

		List<ProductCategory> categoryList = serviceImpl
				.getProductCategoryList();
		model.addAttribute("categoryList", categoryList);

		return "CreateProductCategory";

	}

	/**
	 * This method is called when CreateProductCategory's form is submitted.
	 * 
	 * @param session
	 * @param model
	 * @param categoryId
	 * @param categoryName
	 * @return createProductCategory
	 */
	@RequestMapping(value = "/createProductCategoryAction", method = RequestMethod.POST)
	public String createProductCategory(
			HttpSession session,
			Model model,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "productCatId_name", defaultValue = "") String categoryId,
			@RequestParam(value = "productCatName_name") String categoryName) {
		System.out.println("On Create Product Category Form submitted !!!");
		int userId = Integer.parseInt(session.getAttribute("sessionId")
				.toString());

		// Call to serviceImpl.createProductCategory()
		String successMessage = serviceImpl.createProductCategory(categoryName,
				userId);
		model.addAttribute("successMessage", successMessage);
		redirectAttributes.addFlashAttribute("redirectAttribute",
				successMessage);
		return "redirect:/createProductCategory";

	}

	/**
	 * This method is called, when the pop up on "CreateProductCategory" is
	 * submitted.It will save the data and redirect the page again to
	 * "CreateProductCategory" with a confirmation message.
	 * 
	 * @param redirectAttributes
	 * @param rName
	 * @param msg
	 * @return to the method having "createProductCategory" mapping.
	 */
	@RequestMapping(value = "/createProductCategoryPopUpAction", method = RequestMethod.POST)
	public String submitCreateCategoryPopUp(HttpSession session,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "pCatName") String pCatName) {

		System.out.println("Pop up form submitted");
		int userId = Integer.parseInt(session.getAttribute("sessionId")
				.toString());
		String successMessage = serviceImpl.createProductCategory(pCatName,
				userId);
		redirectAttributes.addFlashAttribute("popUpMessage", "The '" + pCatName
				+ "' " + successMessage);
		return "redirect:/createProductCategory";
	}

	/**
	 * This method is called when the update product category pop up form is
	 * submitted.
	 * 
	 * @param session
	 * @param redirectAttributes
	 * @param catName
	 * @param catId
	 * @return redirect to Create product category with a success method.
	 */
	@RequestMapping(value = "/updateProductCategoryPopUpAction", method = RequestMethod.POST)
	public String submitUpdateCategoryPopUp(HttpSession session,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "catName") String catName,
			@RequestParam(value = "catId") int catId) {

		System.out.println("Update category Pop up form submitted !!");
		String message = serviceImpl.updateProductCategory(catId, catName);
		redirectAttributes.addFlashAttribute("popUpMessage", message);
		return "redirect:/createProductCategory";
	}

	/**
	 * This method will perform the task on the create category page table
	 * according to the action button pressed in table.
	 * 
	 * @param model
	 * @param redirectAttributes
	 * @param seeButton
	 * @param removeButton
	 * @return url
	 */
	@RequestMapping(value = "/createCategoryFormAction", method = RequestMethod.POST)
	public String tableActionsOnCreateCategory(
			Model model,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "seeDetailsName", defaultValue = "") String seeButton,
			@RequestParam(value = "removeCategoryName", defaultValue = "") String removeButton) {

		String url = null;
		String[] split = null;
		boolean seeButtonPressed = seeButton.contains("seeButton");
		boolean removeButtonPressed = removeButton.contains("removeButton");

		if (seeButtonPressed) {

			System.out.println("see category button pressed.");
			split = seeButton.split(" ");
			int catId = Integer.parseInt(split[0]);
			ProductCategory category = serviceImpl
					.findProductCategoryById(catId);
			model.addAttribute("pCategory", category);

			// find sub product categories linked to a category.
			List<SubProductCategory> subCategoryList = serviceImpl
					.findSubProductCategoriesLinkedToACategory(catId);
			model.addAttribute("subCategoryList", subCategoryList);

			url = "SeeProductCategoryDetails";

		} else if (removeButtonPressed) {
			System.out.println("Remove category button pressed.");
			split = removeButton.split(" ");
			int catId = Integer.parseInt(split[0]);
			String successMessage = serviceImpl.removeProductCategory(catId);
			redirectAttributes
					.addFlashAttribute("popUpMessage", successMessage);
			url = "redirect:/createProductCategory";
		}
		return url;
	}

	/**
	 * This method is used to create sub-category by submitting
	 * "createSubCategory" form action.
	 * 
	 * @param model
	 * @param pCatId
	 * @return /redirectToSeeCategory mapping.
	 */
	@RequestMapping(value = "/createSubCategoryAction", method = RequestMethod.POST)
	public String submitCreateSubCategoryForm(
			RedirectAttributes redirectAttributes,
			Model model,
			HttpSession session,
			@RequestParam(value = "subCatName") String subCatName,
			// category Id value is assigned to the submit button's value.
			@RequestParam(value = "create_sub_cat_name") String createButtonPressed) {

		int userId = Integer.parseInt(session.getAttribute("sessionId")
				.toString());
		int catId = Integer.parseInt(createButtonPressed);

		String message = serviceImpl.createSubCategory(catId, userId,
				subCatName);
		String successMessage = "The '" + subCatName + "' " + message;
		redirectAttributes.addFlashAttribute("popUpMessage", successMessage);
		redirectAttributes.addAttribute("catId", catId);
		return "redirect:/redirectToSeeCategory";
	}

	/**
	 * This method is used when a sub category is created, it will redirect us
	 * to the page(See details) with a success message and a category id, as it
	 * is required to get the category details.
	 * 
	 * @param session
	 * @param model
	 * @param redirectAttribute
	 * @param popUpMessage
	 * @return SeeProductCategoryDetails
	 */
	@RequestMapping(value = "/redirectToSeeCategory", method = RequestMethod.GET)
	public String redirectToSeeCategoryDetails(HttpSession session,
			Model model,
			// redirected attributes from the pages from which it is redirected.
			@ModelAttribute(value = "catId") int catId,
			@ModelAttribute(value = "popUpMessage") String popUpMessage) {

		System.out.println("Categery success message : " + popUpMessage);
		System.out.println("catId  : " + catId);

		// get details of category for redirection on same page.
		ProductCategory category = serviceImpl.findProductCategoryById(catId);
		model.addAttribute("pCategory", category);

		// find sub product categories linked to a category.
		List<SubProductCategory> subCategoryList = serviceImpl
				.findSubProductCategoriesLinkedToACategory(catId);
		model.addAttribute("subCategoryList", subCategoryList);

		return "SeeProductCategoryDetails";
	}

	/**
	 * Action on see product details table.
	 * 
	 * @param model
	 * @param redirectAttributes
	 * @param seeButton
	 * @param removeButton
	 * @param updateButton
	 * @return url
	 */
	@RequestMapping(value = "/subCategoryTableForm", method = RequestMethod.POST)
	public String tableActionOnSeeProductCategoryDetails(
			Model model,
			HttpSession session,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "seeSubCategoryDetailsName", defaultValue = "") String seeButton,
			@RequestParam(value = "removeSubCategoryName", defaultValue = "") String removeButton,
			@RequestParam(value = "updateSubCategoryName", defaultValue = "") String updateButton,
			@RequestParam(value = "createProductName", defaultValue = "") String createButton) {

		// Only create product function is done, and others are having catId,
		// which should be replaced by subcatId.

		String url = null;
		String[] split = null;
		boolean seeButtonPressed = seeButton.contains("seeButton");
		boolean removeButtonPressed = removeButton.contains("removeButton");
		boolean updateButtonPressed = updateButton.contains("updateButton");
		boolean createButtonPressed = createButton.contains("createButton");

		if (seeButtonPressed) {

			System.out.println("see category button pressed.");
			split = seeButton.split(" ");
			int catId = Integer.parseInt(split[0]);
			ProductCategory category = serviceImpl
					.findProductCategoryById(catId);
			model.addAttribute("pCategory", category);

			// find sub product categories linked to a category.
			List<SubProductCategory> subCategoryList = serviceImpl
					.findSubProductCategoriesLinkedToACategory(catId);
			model.addAttribute("subCategoryList", subCategoryList);

			url = "SeeProductCategoryDetails";

		} else if (removeButtonPressed) {
			System.out.println("Remove category button pressed.");
			split = removeButton.split(" ");
			int catId = Integer.parseInt(split[0]);
			String successMessage = serviceImpl.removeProductCategory(catId);
			redirectAttributes
					.addFlashAttribute("popUpMessage", successMessage);
			url = "redirect:/createProductCategory";
			// Not completed.
		} else if (updateButtonPressed) {

			System.out.println("update button pressed.");
			split = updateButton.split(" ");
			int catId = Integer.parseInt(split[0]);
			ProductCategory category = serviceImpl
					.findProductCategoryById(catId);
			model.addAttribute("category", category);
		} else if (createButtonPressed) {
			System.out.println("create button pressed.");

			split = createButton.split(" ");
			// for redirection its better to use redirectAttributes than model.
			redirectAttributes.addAttribute("catId", split[0]);
			redirectAttributes.addAttribute("subCatId", split[1]);
			redirectAttributes.addAttribute("subCatName", split[2]);
			url = "redirect:/redirectCreateProduct";
		}
		return url;
	}

	/**
	 * This method is a mapping to actionButtonOnSeeProductCategoryDetails() to
	 * redirect us on create product page with the model attributes. category
	 * and sub category id.
	 * 
	 * @param sCatId
	 * @param sSubCatId
	 * @return CreateProduct page
	 */
	@RequestMapping(value = "/redirectCreateProduct", method = RequestMethod.GET)
	public String redirectCreateProduct(Model model,
			@ModelAttribute(value = "catId") int catId,
			@ModelAttribute(value = "subCatId") int subCatId,
			@ModelAttribute(value = "subCatName") String subCatName,
			@ModelAttribute(value = "popUpMessage") String popUpMessage) {

		System.out.println(catId);
		System.out.println(subCatId);

		List<Products> productList = serviceImpl
				.getProductListBySubCategoryId(subCatId);
		model.addAttribute("productList", productList);

		return "CreateProduct";
	}

	/**
	 * This method is used to create the product once the form is submitted.
	 * 
	 * @param model
	 * @param session
	 * @param redirectAttributes
	 * @param sCatId
	 * @param sSubCatId
	 * @param productName
	 * @param brand
	 * @param sPrice
	 * @param offer
	 * @param photos
	 * @param specifications
	 * @param quantity
	 * @return call to /redirectCreateProduct mapping.
	 */
	@RequestMapping(value = "/createProductAction", method = RequestMethod.POST)
	public String createProductFormSubmission(Model model, HttpSession session,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "catId") int catId,
			@RequestParam(value = "subCatId") int subCatId,
			@RequestParam(value = "productName") String productName,
			@RequestParam(value = "brandName") String brand,
			@RequestParam(value = "costPrice") double cPrice,
			@RequestParam(value = "OffersName") String offer,
			@RequestParam(value = "photosName") String photos,
			@RequestParam(value = "specificationsName") String specifications,
			@RequestParam(value = "quantity") int quantity,
			@RequestParam(value = "salePrice") double sPrice) {

		int userId = Integer.parseInt(session.getAttribute("sessionId")
				.toString());

		String successMessage = serviceImpl.createProduct(userId, catId,
				subCatId, productName, brand, cPrice, offer, photos,
				specifications, quantity, sPrice);
		// to get sub category name.
		SubProductCategory subCategoryDetails = serviceImpl
				.findSubProductCategoryDetailsById(subCatId);
		// redirectAttributes
		redirectAttributes.addAttribute("catId", catId);
		redirectAttributes.addAttribute("subCatId", subCatId);
		redirectAttributes.addAttribute("subCatName",
				subCategoryDetails.getSubCategoryName());
		redirectAttributes.addFlashAttribute("popUpMessage", successMessage);

		return "redirect:/redirectCreateProduct";
	}

	/**
	 * Action button mapping on create product page.
	 * 
	 * @param model
	 * @param session
	 * @param redirectAttributes
	 * @param seeButton
	 * @param removeButton
	 * @param updateButton
	 * @return url
	 */
	@RequestMapping(value = "/createProductTableForm", method = RequestMethod.POST)
	public String tableActionsOnCreateProduct(
			Model model,
			HttpSession session,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "seeProductDetailsName", defaultValue = "") String seeButton,
			@RequestParam(value = "removeProductName", defaultValue = "") String removeButton,
			@RequestParam(value = "updateProductName", defaultValue = "") String updateButton) {

		String url = null;
		String[] split = null;

		boolean seeButtonPressed = seeButton.contains("seeButton");
		boolean removeButtonPressed = removeButton.contains("removeButton");
		boolean updateButtonPressed = updateButton.contains("updateButton");

		String username = session.getAttribute("username").toString();
		if (seeButtonPressed) {

			split = seeButton.split(" ");
			int productId = Integer.parseInt(split[0]);
			Products product = serviceImpl.findProductById(productId);
			String[] photos = CommonUtil.photoURLSplitter(product
					.getProductPhotos());
			model.addAttribute("photoList", photos);
			model.addAttribute("product", product);
			model.addAttribute("username", username);
			url = "SeeProductDetails";
		} else if (removeButtonPressed) {

		} else if (updateButtonPressed) {

		}
		return url;
	}

	/**
	 * This method is called when the create client pop up form is submitted.
	 * 
	 * @param session
	 * @param model
	 * @param redirectAttributes
	 * @param clientName
	 * @param email
	 * @param mobile
	 * @param address
	 * @param pincode
	 * @return createClient
	 */
	@RequestMapping(value = "/createClientPopUpAction", method = RequestMethod.POST)
	public String submitCreateClientPopUp(HttpSession session, Model model,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "clientName") String clientName,
			@RequestParam(value = "email") String email,
			@RequestParam(value = "mobile") String mobile,
			@RequestParam(value = "address") String address,
			@RequestParam(value = "pincode") String pincode,
			@RequestParam(value = "balance") double balance) {
		System.out.println("createClientPopUpAction Submitted !!!");
		int userId = Integer.parseInt(session.getAttribute("sessionId")
				.toString());
		String message = serviceImpl.createClient(clientName, email, mobile,
				address, pincode, userId, balance);
		String successMessage = "The client '" + clientName + "' " + message;
		redirectAttributes.addFlashAttribute("popUpMessage", successMessage);

		return "redirect:/createClient";

	}

	/**
	 * This method is called when the update client pop up form is submitted.
	 * 
	 * @param session
	 * @param model
	 * @param redirectAttributes
	 * @param clientId
	 * @param clientName
	 * @param email
	 * @param mobile
	 * @param address
	 * @param pincode
	 * @param balance
	 * @return
	 */
	@RequestMapping(value = "/updateClientPopUpAction", method = RequestMethod.POST)
	public String submitUpdateClientPopUp(HttpSession session, Model model,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "clientId") int clientId,
			@RequestParam(value = "clientName") String clientName,
			@RequestParam(value = "email") String email,
			@RequestParam(value = "mobile") String mobile,
			@RequestParam(value = "address") String address,
			@RequestParam(value = "pincode") String pincode,
			@RequestParam(value = "balance") double balance) {
		System.out.println("updateClientPopUpAction Submitted !!!");
		int userId = Integer.parseInt(session.getAttribute("sessionId")
				.toString());
		String message = serviceImpl.updateClientById(clientId, address,
				balance, clientName, null, email, mobile, pincode, userId);

		redirectAttributes.addFlashAttribute("popUpMessage", message);

		return "redirect:/createClient";

	}

	/**
	 * This method is a mapping to redirect us to the ClientList.jsp page. Use
	 * the same mapping as we declared in the "redirect:" parameter of
	 * submitCreateClientPopUp() method.
	 * 
	 * @param session
	 * @param model
	 * @param popUpMessage
	 * @return ClientList page
	 */
	@RequestMapping(value = "/createClient", method = RequestMethod.GET)
	public String redirectCreateClient(HttpSession session, Model model,
			@ModelAttribute(value = "popUpMessage") String popUpMessage) {
		System.out.println("On Create Client page !!!");
		List<Clients> clientList = serviceImpl.getClientList();
		model.addAttribute("username", session.getAttribute("username")
				.toString());
		model.addAttribute("clientList", clientList);
		return "ClientList";

	}

	/**
	 * This method will perform the task on the create client page table
	 * according to the action button pressed in table.
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/createClientTableForm", method = RequestMethod.POST)
	public String tableActionsOnCreateClient(
			Model model,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "seeDetailsName", defaultValue = "") String seeButton,
			@RequestParam(value = "removeClientName", defaultValue = "") String removeButton,
			@RequestParam(value = "updateClientName", defaultValue = "") String updateButton,
			@RequestParam(value = "createTransactionName", defaultValue = "") String transactionButton) {
		System.out.println("createClientTableForm Submitted !!!");

		String url = null;
		String[] split = null;
		int clientId = 0;
		boolean seeButtonPressed = seeButton.contains("seeButton");
		boolean removeButtonPressed = removeButton.contains("removeButton");
		boolean updateButtonPressed = updateButton.contains("updateButton");
		boolean transactionButtonPressed = transactionButton
				.contains("createTransaction");

		if (seeButtonPressed) {

			split = seeButton.split(" ");
			clientId = Integer.parseInt(split[0]);
			redirectAttributes.addAttribute("clientId", clientId);
			url = "redirect:/seeClient";
		} else if (removeButtonPressed) {
			split = removeButton.split(" ");
			clientId = Integer.parseInt(split[0]);
			String message = serviceImpl.removeClientById(clientId);
			redirectAttributes.addFlashAttribute("popUpMessage", message);
			url = "redirect:/createClient";
		} else if (updateButtonPressed) {

			split = updateButton.split(" ");
			clientId = Integer.parseInt(split[0]);
		} else if (transactionButtonPressed) {
			boolean fromClient = true;
			split = transactionButton.split(" ");
			clientId = Integer.parseInt(split[0]);
			redirectAttributes.addAttribute("fromClient", fromClient);
			redirectAttributes.addAttribute("clientId", clientId);
			url = "redirect:/transactions";

		}
		return url;

	}

	/**
	 * This method is use to redirect us to the SeeClientDetails page.
	 * 
	 * @param model
	 * @param clientId
	 * @param popUpMessage
	 * @return SeeClientDetails page.
	 */
	@RequestMapping(value = "/seeClient", method = RequestMethod.GET)
	public String redirectToSeeClient(Model model,
			@ModelAttribute(value = "clientId") int clientId,
			@ModelAttribute(value = "popUpMessage") String popUpMessage) {
		System.out.println("redirected to see client page !!");
		Clients client = serviceImpl.findClientDetailsById(clientId);
		model.addAttribute("client", client);
		return "SeeClientDetails";
	}

	/**
	 * This method is used to redirect us on transaction list page from client
	 * table action link and home's transaction button based on a boolean.
	 * 
	 * @param session
	 * @param model
	 * @param sCatId
	 * @return TransactionList
	 */
	@RequestMapping(value = "/transactions", method = RequestMethod.GET)
	public String redirectToTransactions(HttpSession session, Model model,
			@ModelAttribute(value = "successMessage") String successMessage,
			@ModelAttribute(value = "fromClient") boolean fromClient,
			@ModelAttribute(value = "clientId") int clientId,
			@RequestParam(value = "category", defaultValue = "") String sCatId) {
		String url = null;
		if (fromClient) {
			System.out.println("On Transaction through Client !!!");
			// client details
			Clients clientDetails = serviceImpl.findClientDetailsById(clientId);
			// get Transactions linked to a client
			List<Transaction> clientTransactionList = serviceImpl
					.getTransactionsLinkedToAClient(clientId);
			// category list
			List<ProductCategory> productCategoryList = serviceImpl
					.getProductCategoryList();
			// sub category list.
			List<SubProductCategory> subCategoryList = serviceImpl
					.getSubCategoryList();

			// product List.
			List<Products> productList = serviceImpl.getProductList();

			model.addAttribute("subCategoryList", subCategoryList);
			model.addAttribute("productCategoryList", productCategoryList);
			model.addAttribute("productList", productList);
			model.addAttribute("clientTransactionList", clientTransactionList);
			model.addAttribute("fromClient", fromClient);
			model.addAttribute("clientDetails", clientDetails);
			url = "TransactionList";

		} else {
			// for home transaction button
			System.out.println("On Transaction through Home !!!");

			// client list
			List<Clients> clientList = serviceImpl.getClientList();
			// category list
			List<ProductCategory> productCategoryList = serviceImpl
					.getProductCategoryList();
			// sub category list.
			List<SubProductCategory> subCategoryList = serviceImpl
					.getSubCategoryList();

			// product List.
			List<Products> productList = serviceImpl.getProductList();

			// transaction List
			List<Transaction> transactionList = serviceImpl
					.getTransactionList();

			model.addAttribute("subCategoryList", subCategoryList);
			model.addAttribute("productCategoryList", productCategoryList);
			model.addAttribute("productList", productList);
			model.addAttribute("fromClient", fromClient);
			model.addAttribute("clientList", clientList);
			model.addAttribute("transactionList", transactionList);

			url = "TransactionList";

		}
		return url;
	}

	/**
	 * This method is used to submit the form on transaction list page with
	 * action "transactionFormAction".
	 * 
	 * @param session
	 * @param model
	 * @param sCatId
	 * @return
	 */
	@RequestMapping(value = "/transactionFormAction", method = RequestMethod.POST)
	public String transactionFormAction(
			HttpSession session,
			Model model,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "category", defaultValue = "") int catId,
			// when transaction page is access through client list.
			@RequestParam(value = "hClientDetails", defaultValue = "") String cDViaClient,
			@RequestParam(value = "subCategory") int subCatId,
			@RequestParam(value = "product") String productDetails,
			@RequestParam(value = "quantity") int quantity,
			@RequestParam(value = "amount") double amount,
			// directly from home transaction button.
			@RequestParam(value = "clientFromHome", defaultValue = "") String cDViaHome,
			@RequestParam(value = "fromClient") boolean fromClient) {
		System.out.println("On transactionFormAction !!!");
		String[] split = null;
		int clientId = 0;
		String clientName = null;
		int productId = 0;
		String productName = null;
		int userId = Integer.parseInt(session.getAttribute("sessionId")
				.toString());
		String username = session.getAttribute("username").toString();

		Clients clientDetails = new Clients();
		// split to get client id and name.
		if (cDViaClient != null && !cDViaClient.equals("")) {
			split = cDViaClient.split("\\|");
			clientId = Integer.parseInt(split[0]);
			clientName = split[1];
			clientDetails = serviceImpl.findClientDetailsById(clientId);
		} else if (cDViaHome != null && !cDViaHome.equals("")) {
			split = cDViaHome.split("\\|");
			clientId = Integer.parseInt(split[0]);
			clientName = split[1];
			clientDetails = serviceImpl.findClientDetailsById(clientId);
		}
		// deduct client balance according to transaction amount.
		double afterBal = clientDetails.getBalance() - amount;

		// split to get product id and name.
		String[] productSplit = productDetails.split("\\|");
		productId = Integer.parseInt(productSplit[0]);
		productName = productSplit[1];
		String message = serviceImpl.createTransaction(catId, clientId,
				clientName, subCatId, productId, quantity, amount, userId,
				productName, afterBal);

		redirectAttributes.addFlashAttribute("successMessage", message);
		redirectAttributes.addAttribute("fromClient", fromClient);
		redirectAttributes.addAttribute("clientId", clientId);
		model.addAttribute("userId", userId);
		model.addAttribute("username", username);
		return "redirect:/transactions";

	}

	/**
	 * This method is used to return the sub category list linked to a category
	 * to ajax method.
	 * 
	 * 
	 * @param sCatId
	 * @param map
	 * @return subCategoryList
	 */
	@RequestMapping(value = "/getSubCatOnCat", method = RequestMethod.GET)
	public @ResponseBody
	List<SubProductCategory> getSubCatList(
			@RequestParam(value = "subCat", required = true) String sCatId,
			ModelMap map) {
		int catId = Integer.parseInt(sCatId);
		System.out.println(catId);
		List<SubProductCategory> subCategoryList = serviceImpl
				.findSubProductCategoriesLinkedToACategory(catId);

		return subCategoryList;
	}

	/**
	 * This method is used to return the product list linked to a sub category
	 * to ajax method.
	 * 
	 * @param sSubCatId
	 * @param map
	 * @return productNameList
	 */
	@RequestMapping(value = "/getProductOnSubCategory", method = RequestMethod.GET)
	public @ResponseBody
	String getProductList(
			@RequestParam(value = "subCat", required = true) String sSubCatId,
			ModelMap map) {
		int subCatId = Integer.parseInt(sSubCatId);
		List<Products> productList = serviceImpl
				.getProductListBySubCategoryId(subCatId);
		GsonBuilder gsonBuilder = new GsonBuilder();
		Gson productGson = gsonBuilder.registerTypeAdapter(Products.class,
				new ProductAdaptor()).create();
		String jsonFormat = productGson.toJson(productList);
		return jsonFormat;
	}

	/**
	 * This method is used to get the product price and give response to the
	 * mapped ajax method.
	 * 
	 * @param productDetail
	 * @param map
	 * @return productPrice
	 */
	@RequestMapping(value = "/getProductDetailsForBalanceCalculation", method = RequestMethod.GET)
	public @ResponseBody
	double getProductDetailsForBalanceCalculation(
			@RequestParam(value = "productDetail", required = true) String productDetail,
			ModelMap map) {
		String[] split = productDetail.split("\\|");
		int productId = Integer.parseInt(split[0]);

		Products product = serviceImpl.findProductById(productId);
		double productPrice = product.getSalePrice();
		return productPrice;
	}

	/**
	 * This method is used to add balance on see client details page.
	 * 
	 * @param redirectAttributes
	 * @param clientId
	 * @param addBal
	 * @return redirect to SeeClient with a success message.
	 */
	@RequestMapping(value = "/addBalanceFormAction", method = RequestMethod.POST)
	public String addBalanceOnClientDetails(
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "clientId", required = true) Integer clientId,
			@RequestParam(value = "aBalance", required = true) Double addBal) {

		System.out.println("Add balance pop up button submitted !!");
		Clients clientDetails = serviceImpl.findClientDetailsById(clientId);
		double newBal = clientDetails.getBalance() + addBal;
		serviceImpl.updateClientById(clientId, null, newBal, null, null, null,
				null, null, null);
		redirectAttributes.addAttribute("clientId", clientId);
		redirectAttributes.addFlashAttribute("popUpMessage",
				"Balance has been added successfully.");
		return "redirect:/seeClient";
	}

	/**
	 * This method is used to redirect us to StockList page.
	 * 
	 * @param model
	 * @return StockList page
	 */
	@RequestMapping(value = "/stockList", method = RequestMethod.GET)
	public String redirectToStockList(Model model,
			@ModelAttribute(value = "popUpMessage") String popUpMessage) {
		System.out.println("redirected to Stock List page !!");
		// category list
		List<ProductCategory> productCategoryList = serviceImpl
				.getProductCategoryList();
		// stock list
		List<Stock> stockList = serviceImpl.getStockList();
		// product list according to quantity range here range is hard coded to
		// 10 .
		List<Products> pListByQuantity = serviceImpl
				.getProductListByQuantity(10);

		model.addAttribute("stockList", stockList);
		model.addAttribute("productCategoryList", productCategoryList);
		model.addAttribute("pListByQuantity", pListByQuantity);

		return "StockList";
	}

	/**
	 * This method is invoked once the create stock pop up form is submitted.It
	 * will create the stock and redirect us to StockList page with a success
	 * message.
	 * 
	 * @param redirectAttributes
	 * @param catId
	 * @param subCatId
	 * @param pDetails
	 * @param quantity
	 * @return stockList
	 */
	@RequestMapping(value = "/createStockFormAction", method = RequestMethod.POST)
	public String submitCreateStockPopUp(RedirectAttributes redirectAttributes,
			@RequestParam(value = "category") int catId,
			@RequestParam(value = "subCategory") int subCatId,
			@RequestParam(value = "product") String pDetails,
			@RequestParam(value = "quantity") int quantity) {
		System.out.println("create stock pop up submitted !!");
		String[] split = pDetails.split("\\|");
		int productId = Integer.parseInt(split[0]);
		String productName = split[1];

		String message = serviceImpl.createStock(catId, subCatId, productId,
				productName, quantity);
		redirectAttributes.addFlashAttribute("popUpMessage", message);
		return "redirect:/stockList";
	}

	/**
	 * This method is used to redirect us to vendor list page.
	 * 
	 * @param model
	 * @param popUpMessage
	 * @return Vendor List
	 */
	@RequestMapping(value = "/vendorList", method = RequestMethod.GET)
	public String redirectToVendorList(Model model,
			@ModelAttribute(value = "popUpMessage") String popUpMessage,
			@ModelAttribute(value = "presentProducts") String presentProducts) {
		System.out.println("On Vender List Page !!");
		List<Vendors> vendorList = serviceImpl.getVendorList();
		model.addAttribute("vendorList", vendorList);
		return "VendorList";
	}

	/**
	 * This method is used to create the vendor when the create vendor pop up is
	 * submitted.
	 * 
	 * @param session
	 * @param redirectAttributes
	 * @param company
	 * @param email
	 * @param mobile
	 * @param address
	 * @param pincode
	 * @return vendor list page with a success message
	 */
	@RequestMapping(value = "/createVendorPopUpAction", method = RequestMethod.POST)
	public String submitCreateVendorPopUp(HttpSession session,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "company") String company,
			@RequestParam(value = "email") String email,
			@RequestParam(value = "mobile") String mobile,
			@RequestParam(value = "address") String address,
			@RequestParam(value = "pincode") String pincode) {
		System.out.println("Create Vender Pop up submitted !!");
		int userId = Integer.parseInt(session.getAttribute("sessionId")
				.toString());
		String message = serviceImpl.createVendor(company, email, mobile,
				address, pincode, userId);
		redirectAttributes.addFlashAttribute("popUpMessage", message);

		return "redirect:/vendorList";
	}

	/**
	 * This method will perform the task on the vendor list page table according
	 * to the action button pressed in table.
	 * 
	 * @param model
	 * @param redirectAttributes
	 * @param seeButton
	 * @param removeButton
	 * @param updateButton
	 * @return url
	 */
	@RequestMapping(value = "/vendorTableFormAction", method = RequestMethod.POST)
	public String tableActoinOnVendo(
			Model model,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "seeVendor", defaultValue = "") String seeButton,
			@RequestParam(value = "removeVendor", defaultValue = "") String removeButton,
			@RequestParam(value = "updateVendor", defaultValue = "") String updateButton) {
		System.out.println("On action button on Vender List Page !!");

		String url = null;
		String[] split = null;
		boolean seeButtonPressed = seeButton.contains("seeButton");
		boolean removeButtonPressed = removeButton.contains("removeButton");
		boolean updateButtonPressed = updateButton.contains("updateButton");

		if (seeButtonPressed) {
			split = seeButton.split(" ");
			int vendorId = Integer.parseInt(split[0]);
			String pName = "";
			Vendors vendor = serviceImpl.findVendorById(vendorId);
			List<Products> productList = serviceImpl.getProductList();
			List<VendorProducts> vp = serviceImpl
					.getProductsLinkedToVendor(vendorId);
			for (VendorProducts vProducts : vp) {
				if (vProducts != null) {
					pName += vProducts.getProductName() + ", ";
				}
			}
			model.addAttribute("vpList", vp);
			model.addAttribute("vendor", vendor);
			model.addAttribute("productList", productList);
			model.addAttribute("pName", pName);
			url = "SeeVendor";
		} else if (removeButtonPressed) {

		} else if (updateButtonPressed) {

		}
		return url;
	}

	/**
	 * This method is used to link products to the vendor, when the
	 * "LinkProductsToVendorPopUp" is submitted.
	 * 
	 * @param model
	 * @param redirectAttributes
	 * @param vendorId
	 * @param company
	 * @param productDetails
	 * @return vendor list page with a success message.
	 */
	@RequestMapping(value = "/LinkProductsToVendorPopUpAction", method = RequestMethod.POST)
	public String submitLinkProductPopUp(Model model,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "hId") int vendorId,
			@RequestParam(value = "hCompany") String company,
			@RequestParam(value = "productDetails") String productDetails) {
		System.out.println("On Vender List Page !!");
		String message = null;
		String alreadyLinked = "";
		List<String> pList = new ArrayList<String>();
		// get all the products linked to a vendor
		List<VendorProducts> linkedProducts = serviceImpl
				.getProductsLinkedToVendor(vendorId);
		// get the product name list for a vendor
		for (VendorProducts vp : linkedProducts) {
			pList.add(vp.getProductName());
		}

		// add all the product details to database in separate mode(different
		// rows).
		String[] products = productDetails.split(",");
		for (String product : products) {
			String[] split = product.split("\\|");
			int pId = Integer.parseInt(split[0]);
			String pName = split[1];

			if (pList.contains(pName)) {
				alreadyLinked += pName + ", ";
			} else {
				message = serviceImpl.createProductsForVendor(vendorId,
						company, pId, pName);
			}
		}
		redirectAttributes.addFlashAttribute("popUpMessage", message);
		if (!alreadyLinked.equals("")) {
			redirectAttributes.addFlashAttribute("presentProducts",
					alreadyLinked + " are already linked to this vendor.");
		}
		return "redirect:/vendorList";
	}

	/**
	 * This method is used to redirect us to invoice list page.
	 * 
	 * @param model
	 * @param popUpMessage
	 * @return invoice list page
	 */
	@RequestMapping(value = "/invoiceList", method = RequestMethod.GET)
	public String redirectToInvoiceList(Model model,
			@ModelAttribute(value = "popUpMessage") String popUpMessage) {
		System.out.println("On Invoice List Page !!");

		// client list
		List<Clients> clientList = serviceImpl.getClientList();
		// product category list
		List<ProductCategory> productCategoryList = serviceImpl
				.getProductCategoryList();
		// invoice list
		List<Invoice> invoiceList = serviceImpl.getInvoiceList();

		model.addAttribute("clientList", clientList);
		model.addAttribute("productCategoryList", productCategoryList);
		model.addAttribute("invoiceList", invoiceList);

		return "InvoiceList";
	}

	@RequestMapping(value = "/createInvoiceFormAction", method = RequestMethod.POST)
	public String submitCreateInvoiceForm(
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "json", required = true) String tableData) {

		Gson gson = new Gson();
		JsonParser jParser = new JsonParser();
		JsonArray jArray = jParser.parse(tableData).getAsJsonArray();

		ArrayList<DtoInvoice> iList = new ArrayList<DtoInvoice>();

		for (JsonElement jElement : jArray) {
			DtoInvoice invoice = gson.fromJson(jElement, DtoInvoice.class);
			iList.add(invoice);
		}
		// To remove header and footer information of table.
		iList.remove(0);
		iList.remove(0);

		String message = serviceImpl.createInvoice(iList);
		redirectAttributes.addFlashAttribute("popUpMessage", message);
		return "redirect:/invoiceList";
	}

	/**
	 * This method is used to get invoice details in pdf format when the see
	 * invoice details pop up is submitted.
	 * 
	 * @param invoiceId
	 * @return call to PDFBuilder class.
	 */
	@RequestMapping(value = "/seeInvoicePopUpAction", method = RequestMethod.GET)
	public ModelAndView downloadInvoicePDF(
			@RequestParam(value = "invoiceDetails") int invoiceId) {

		// Get invoice details by id.
		Invoice iDetail = serviceImpl.findInvoiceById(invoiceId);
		Set<InvoiceDetail> invoiceDetail = iDetail.getInvoiceDetail();
		// return a view which will be resolved by an excel view resolver
		return new ModelAndView("pdfView", "invoiceDetail", invoiceDetail);
	}

	@RequestMapping(value = "/analysis", method = RequestMethod.GET, produces = "application/json")
	public String redirectToAnalysis(
			Model model,
			ModelMap map,
			@ModelAttribute(value = "sumOfCP") String sumOfCP,
			@ModelAttribute(value = "sumOfSP") String sumOfSP,
			@ModelAttribute(value = "totalSoldProducts") String totalSoldProducts,
			@ModelAttribute(value = "maxSoldProductDetails") String maxSoldProductDetails,
			@ModelAttribute(value = "minSoldProductDetails") String minSoldProductDetails,
			@ModelAttribute(value = "totalStock") String totalStock) {

		// details for maximum sold products.
		String maxPName = null;
		long maxPCount = 0;
		if (maxSoldProductDetails != null && !maxSoldProductDetails.equals("")) {
			String[] maxSplit = maxSoldProductDetails.toString().split(",");
			// maxPId = Integer.parseInt(maxSplit[0].trim());
			maxPName = maxSplit[1];
			maxPCount = Long.parseLong(maxSplit[2]);

			model.addAttribute("maxPName", maxPName);
			model.addAttribute("maxPCount", maxPCount);
		}
		// details for minimum sold products.
		String minPName = null;
		long minPCount = 0;
		if (minSoldProductDetails != null && !minSoldProductDetails.equals("")) {
			String[] minSplit = minSoldProductDetails.toString().split(",");
			// minPId = Integer.parseInt(minSplit[0].trim());
			minPName = minSplit[1];
			minPCount = Long.parseLong(minSplit[2]);

			model.addAttribute("minPName", minPName);
			model.addAttribute("minPCount", minPCount);
		}

		// // JSON format for Flot Pie chart.
		// if ((maxSoldProductDetails != null &&
		// !maxSoldProductDetails.equals(""))
		// && (minSoldProductDetails != null && !minSoldProductDetails
		// .equals(""))) {
		// String other = "Other";
		// String dataForPie = "[{"
		// + "label: "
		// + "\""
		// + maxPName
		// + "\""
		// + ", data: "
		// + maxPCount
		// + "},{"
		// + "label: "
		// + "\""
		// + minPName
		// + "\""
		// + ", data: "
		// + minPCount
		// + "},{"
		// + "label: "
		// + "\""
		// + other
		// + "\""
		// + ", data: "
		// + (Long.parseLong(totalSoldProducts) - (maxPCount + minPCount))
		// + "}]";
		//
		// System.out.println("String : " + dataForPie);
		//
		// // JSON Adaptor
		// List<DtoAnalysisPie> pieDataList = new ArrayList<DtoAnalysisPie>();
		// pieDataList.add(new DtoAnalysisPie(maxPName, maxPCount));
		// pieDataList.add(new DtoAnalysisPie(minPName, minPCount));
		// pieDataList.add(new DtoAnalysisPie("Other", Long
		// .parseLong(totalSoldProducts) - (maxPCount + minPCount)));
		//
		// GsonBuilder gsonBuilder = new GsonBuilder();
		// Gson pieGson = gsonBuilder.registerTypeAdapter(
		// DtoAnalysisPie.class, new DtoAnalysisPieAdapter()).create();
		// String jsonFormat = pieGson.toJson(pieDataList);
		// System.out.println("JSON Adapter : " + jsonFormat);
		// model.addAttribute("data", jsonFormat);
		//
		// model.addAttribute("data", dataForPie);
		// }

		return "Analysis";
	}

	@RequestMapping(value = "/analysisFormAction", method = RequestMethod.GET)
	public String submitAnalysisForm(RedirectAttributes redirectAttributes,
			@RequestParam(value = "dFrom") String from,
			@RequestParam(value = "dTo") String to) {

		Date dFrom = CommonUtil.dateFormat(from);
		Date dTo = CommonUtil.dateFormat(to);
		double sumOfCostPrice = serviceImpl.getSumOfCostPriceForDateRange(
				dFrom, dTo);
		double sumOfSP = serviceImpl.getSumOfSalePriceForDateRange(dFrom, dTo);

		long totalSoldProducts = serviceImpl.getTotalSoldProductsForDateRange(
				dFrom, dTo);
		Object maxSoldProductDetails = serviceImpl
				.getMaximumSoldProductForDateRange(dFrom, dTo);
		Object minSoldProductDetails = serviceImpl
				.getMinimumSoldProductForDateRange(dFrom, dTo);
		Long totalStock = serviceImpl.getTotalStock();

		redirectAttributes.addAttribute("sumOfCP", sumOfCostPrice);
		redirectAttributes.addAttribute("sumOfSP", sumOfSP);
		redirectAttributes.addAttribute("totalSoldProducts", totalSoldProducts);
		redirectAttributes.addAttribute("maxSoldProductDetails",
				maxSoldProductDetails);
		redirectAttributes.addAttribute("minSoldProductDetails",
				minSoldProductDetails);
		redirectAttributes.addAttribute("totalStock", totalStock);

		return "redirect:/analysis";
	}
}
