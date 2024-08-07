package com.mycompany.isp392.controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MainController extends HttpServlet {

    private static final String WELCOME = "HomePageController";

    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";

    private static final String REGISTER_PAGE = "Sign_Up";
    private static final String REGISTER_PAGE_VIEW = "US_SignUp.jsp";
    private static final String REGISTER = "Sign In";
    private static final String REGISTER_CONTROLLER = "RegisterController";

    private static final String ADD_EMPLOYEE_PAGE = "Add_Employee_View";
    private static final String ADD_EMPLOYEE_PAGE_VIEW = "AD_AddEmployees.jsp";
    private static final String ADD_EMPLOYEE_CONTROLLER = "AddEmployeeController";
    private static final String ADD_EMPLOYEE = "Add_Employee";

    private static final String ADD_PRODUCT_PAGE = "Add_Product_Page";
    private static final String ADD_PRODUCT_PAGE_VIEW = "GetBrandsController";

    private static final String EDIT_PRODUCT_PAGE = "Edit_Product_Page";
    private static final String EDIT_PRODUCT_PAGE_VIEW = "GetSpecificProductController";

    private static final String GET_PRODUCTS_PAGE = "Manage_Products_Page";
    private static final String GET_PRODUCTS_PAGE_VIEW = "GetProductsController";

    private static final String ADD_PRODUCT = "Add_Product";
    private static final String ADD_PRODUCT_CONTROLLER = "AddProductController";

    private static final String SEARCH_PRODUCT = "Search_Product";
    private static final String SEARCH_PRODUCT_CONTROLLER = "SearchProductController";

    private static final String ADD_BRAND = "Add_Brand";
    private static final String ADD_BRAND_CONTROLLER = "AddBrandController";

    private static final String GET_BRANDS_PAGE = "Manage_Brands_Page";
    private static final String GET_BRANDS_PAGE_VIEW = "GetBrandsController";

    private static final String ADD_BRANDS_PAGE = "Add_Brands_Page";
    private static final String ADD_BRANDS_PAGE_VIEW = "GetBrandsController";

    private static final String EDIT_BRAND_PAGE = "Edit_Brand_Page";
    private static final String EDIT_BRAND_PAGE_VIEW = "GetSpecificBrandController";

    private static final String EDIT_PRODUCT_DETAIL_PAGE = "Edit_Product_Detail_Page";
    private static final String EDIT_PRODUCT_DETAIL_PAGE_VIEW = "GetSpecificProductController";

    private static final String SEARCH_BRAND = "Search_Brand";
    private static final String SEARCH_BRAND_CONTROLLER = "SearchBrandController";

    private static final String DELETE_BRAND = "Delete_Brand";
    private static final String DELETE_BRAND_CONTROLLER = "DeleteBrandController";

    private static final String SENDMAIL = "Send_Email";
    private static final String SEND_EMAIL_CONTROLLER = "SendMailServlet";
    
    private static final String REPLY_SUPPORT = "Reply_Support";
    private static final String SEND_EMAIL_REPLY_SUPPORT = "SendMailServlet";

    private static final String GET_SUPPORT_LIST = "Manage_Support";
    private static final String GET_SUPPORT_LIST_CONTROLLER = "GetSupportListController";

    private static final String VIEW_SUPPORT_PAGE = "ViewSupport";
    private static final String VIEW_SUPPORT_PAGE_CONTROLLER = "ViewSupportController";

    private static final String SEARCH_SUPPORT = "Search Support";
    private static final String SEARCH_SUPPORT_CONTROLLER = "SearchSupportController";

    private static final String REPLY_SUPPORT_PAGE = "ReplySupport";
    private static final String REPLY_SUPPORT_PAGE_VIEW = "GetSupportInfoController";
    
    private static final String BACK_SUPPORT_PAGE = "Back_To_SupportList";
    private static final String BACK_SUPPORT_PAGE_VIEW = "GetSupportListController";

    private static final String SEARCH_PROMOTION = "Search promotion";
    private static final String SEARCH_PROMOTION_CONTROLLER = "SearchPromotionController";

    private static final String EDIT_PROMOTION = "EditPromotion";
    private static final String EDIT_PROMOTION_PAGE = "CopyPromotionController";

    private static final String SAVE_EDIT_PROMOTION = "SaveEditPromotion";
    private static final String EDIT_PROMOTION_CONTROLLER = "EditPromotionController";

    private static final String DELETE_PROMOTION = "DeletePromotion";
    private static final String DELETE_PROMOTION_CONTROLLER = "DeletePromotionController";
    
    private static final String VIEW_PROMOTION_DETAIL = "ViewDetailPromotion";
    private static final String VIEW_PROMOTION_DETAIL_CONTROLLER = "ViewPromotionDetailController";

    private static final String ADD_CATEGORY_PAGE = "Add_Category_View";
    private static final String ADD_CATEGORY_PAGE_VIEW = "addCategory.jsp";
    private static final String ADD_CATEGORY = "Add_Category";
    private static final String ADD_CATEGORY_CONTROLLER = "AddCategoryController";

    private static final String ADD_CHILDREN_CATEGORY_PAGE = "Add_Children_Category_View";
    private static final String ADD_CHILDREN_CATEGORY_PAGE_VIEW = "addChildrenCategory.jsp";
    private static final String ADD_CHILDREN_CATEGORY = "Add_Children_Category";
    private static final String ADD_CHILDREN_CATEGORY_CONTROLLER = "AddChildrenCategoryController";

    private static final String ADD_PROMOTION = "Add_Promotion";
    private static final String ADD_PROMOTION_CONTROLLER = "AddPromotionController";

    private static final String DELETE_USER = "DeleteUser";
    private static final String DELETE_USER_CONTROLLER = "DeleteUserController";

    private static final String EDIT_CATEGORY = "Edit_Category";
    private static final String EDIT_CATEGORY_CONTROLLER = "EditCategoryController";

    private static final String EDIT_CHILDRENCATEGORY = "Edit_ChildrenCategory";
    private static final String EDIT_CHILDRENCATEGORY_CONTROLLER = "EditChildrenCategoryController";

    private static final String DELETE_CATEGORY = "Delete_Category";
    private static final String DELETE_CATEGORY_CONTROLLER = "DeleteCategoryController";

    private static final String DELETE_CHILDREN_CATEGORY = "Delete_ChildrenCategory";
    private static final String DELETE_CHILDREN_CATEGORY_CONTROLLER = "DeleteChildrenCategoryController";

    private static final String SEARCH_CATEGORY_PAGE = "Search_Category_View";
    private static final String SEARCH_PAGE_VIEW = "SearchCategory.jsp";
    private static final String SEARCH_CATEGORY = "Search_Category";
    private static final String SEARCH_CATEGORY_CONTROLLER = "SearchCategoryController";

    private static final String GET_ORDER_LIST = "Manage_Order";
    private static final String BACK_ORDER_LIST = "Back_To_OrderList";
    private static final String GET_ORDER_LIST_CONTROLLER = "GetOrderListController";

    private static final String SEARCH_ORDER_PAGE = "Search_Order_View";
    private static final String SEARCH_ORDER_VIEW = "AD_OrderList.jsp";
    private static final String SEARCH_ORDER = "Search Order";
    private static final String SEARCH_ORDER_CONTROLLER = "SearchOrderController";

    private static final String EDIT_ORDER_PAGE = "EditOrder";
    private static final String EDIT_ORDER_PAGE_VIEW = "GetOrderInforController";

    private static final String EDIT_ORDER = "Update Order Status";
    private static final String DELETE_ORDER = "DeleteOrder";
    private static final String EDIT_ORDER_CONTROLLER = "EditOrderController";

    private static final String VIEW_ORDER = "ViewOrderDetail";
    private static final String VIEW_ORDER_CONTROLLER = "ViewOrderDetailController";

    private static final String FORGOT_PASSWORD_CONTROLLER = "ForgotPasswordController";
    private static final String FORGOT_PASSWORD_PAGE = "Forgot_Password";

    private static final String VERIFY_TOKEN = "Verify_Token";
    private static final String VERIFY_TOKEN_CONTROLLER = "VerifyToken";

    private static final String SEARCH_USER = "Search_User";
    private static final String SEARCH_USER_CONTROLLER = "SearchUserController";

    private static final String EDIT_CUSTOMER_PAGE = "EditCustomerPage";
    private static final String EDIT_CUSTOMER_PAGE_VIEW = "AD_EditCustomer.jsp";

    private static final String EDIT_CUSTOMER = "EditCustomer";
    private static final String EDIT_CUSTOMER_CONTROLLER = "EditCustomerController";

    private static final String EDIT_EMPLOYEE_PAGE = "EditEmployeePage";
    private static final String EDIT_EMPLOYEE_PAGE_VIEW = "AD_EditEmployee.jsp";

    private static final String EDIT_EMPLOYEE = "EditEmployee";
    private static final String EDIT_EMPLOYEE_CONTROLLER = "EditEmployeeController";

    private static final String GET_PRODUCT_PAGE = "Add_Product_Details_Page";
    private static final String GET_PRODUCT_PAGE_VIEW = "GetProductsController";

    private static final String SEARCH_PRODUCT_PAGE = "Search_Product_Page";
    private static final String SEARCH_PRODUCT_PAGE_VIEW = "product.jsp";

    private static final String ADD_PRODUCT_DETAILS = "Add_Product_Details";
    private static final String ADD_PRODUCT_DETAILS_CONTROLLER = "AddProductDetailsController";

    private static final String ADD_PRODUCT_DETAIL_PAGE = "Add_Product_Detail_Page";
    private static final String ADD_PRODUCT_DETAIL_PAGE_VIEW = "GetProductsController";

    private static final String EDIT_PRODUCT = "Edit_Product";
    private static final String EDIT_PRODUCT_CONTROLLER = "EditProductController";

    private static final String EDIT_PRODUCT_DETAILS = "Edit_Product_Details";
    private static final String EDIT_PRODUCT_DETAILS_CONTROLLER = "EditProductDetailsController";

    private static final String DELETE_PRODUCT = "Delete_Product";
    private static final String DELETE_PRODUCT_CONTROLLER = "DeleteProductController";

    private static final String DELETE_DETAILS = "Delete_Detail";
    private static final String DELETE_DETAILS_CONTROLLER = "DeleteProductDetailsController";

    private static final String VIEW_PRIVACY = "View privacy";
    private static final String VIEW_PRIVACY_CONTROLLER = "ViewPrivacyController";

    private static final String MANAGE_PROMOTION_PAGE = "Manage promotions";
    private static final String MANAGE_PROMOTION_PAGE_VIEW = "GetPromotionListController";

    private static final String GET_PRODUCT_DETAIL = "Search_ProductDetail";
    private static final String GET_PRODUCT_DETAIL_CONTROLLER = "GetProductsController";

    private static final String CATEGORY = "Category";
    private static final String CATEGORY_CONTROLLER = "CategoryController";

    private static final String WISHLIST = "wishlist";
    private static final String WISHLIST_CONTROLLER = "WishlistController";

    private static final String DELETE_WISHLIST = "deleteWishlist";
    private static final String DELETE_WISHLIST_CONTROLLER = "DeleteWishlistController";

    private static final String ADD_WISHLIST = "AddToWishlist";
    private static final String ADD_WISHLIST_CONTROLLER = "AddWishlistController";

    private static final String CHECK_OUT_PAGE = "Checkout";
    private static final String VIEW_CHECKOUT_CONTROLLER = "ViewCheckoutController";

    private static final String PLACE_ORDER = "Place Order";
    private static final String CHECKOUT_CONTROLLER = "CheckoutController";

    private static final String VIEW_PROFILE = "View profile";
    private static final String VIEW_PROFILE_CONTROLLER = "ViewProfileController";

    private static final String EDIT_PROFILE = "Edit profile";
    private static final String EDIT_PROFILE_CONTROLLER = "ViewEditProfileController";

    private static final String SAVE_PROFILE = "Save profile";
    private static final String SAVE_PROFILE_CONTROLLER = "SaveProfileController";

    private static final String VIEW_PROMOTION = "View promotion";
    private static final String VIEW_PROMOTION_CONTROLLER = "ViewPromotionController";

    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";

    private static final String GET_CATEGORY_INFO = "GetCategoryInfo";
    private static final String GET_CATEGORY_INFO_CONTROLLER = "GetCategoryInfoController";

    private static final String SEARCH_CHILDREN_CATEGORY = "Search_Children_Category";
    private static final String SEARCH_CHILDREN_CATEGORY_CONTROLLER = "SearchChildrenCategoryController";

    private static final String GET_CHILDREN_CATEGORY_INFO = "GetChildrenCategoryInfo";
    private static final String GET_CHILDREN_CATEGORY_INFO_CONTROLLER = "GetChildrenCategoryInfoController";

    private static final String HISTORY = "History";
    private static final String HISTORY_CONTROLLER = "ShowHistoryController";

    private static final String GET_USER_INFO = "GetUserInfo";
    private static final String GET_USER_INFO_CONTROLLER = "GetUserInfoController";

    private static final String REQUEST_FOR_SUPPORT = "Request For Support";
    private static final String REQUEST_FOR_SUPPORT_CONTROLLER = "RequestSupportController";

    private static final String GET_PRODUCTBYID = "Get_product_detail";
    private static final String GET_PRODUCTBYID_CONTROLLER = "GetProductDetails";

    private static final String GET_PRODUCT_BY_PRICES = "Get_product_by_price";
    private static final String GET_PRODUCT_BY_PRICE_CONTROLLER = "FilterProductsByPriceController";

    private static final String GET_PRODUCT_BY_BRAND = "Get_product_by_brand";
    private static final String GET_PRODUCT_BY_BRAND_CONTROLLER = "FilterProductByBrandController";

    private static final String ALL_PRODUCT = "All_Product";
    private static final String ALL_PRODUCT_PAGE = "ViewAllProductController";

    private static final String PROMOTION_CHECKER = "Check Promotion";
    private static final String PROMOTION_CHECKER_CONTROLLER = "PromotionCheckerController";

    private static final String VIEW_US_ORDER = "ViewUSOrder";
    private static final String VIEW_US_ORDER_CONTROLLER = "ViewUSOrderController";
    
    private static final String VIEW_US_ORDER_DETAIL = "View_Order_Detail";
    private static final String VIEW_US_ORDER_DETAIL_CONTROLLER = "ViewUSOrderDetailsController";

    private static final String CANCEL_ORDER = "CancelOrder";
    private static final String CANCEL_ORDER_CONTROLLER = "CancelOrderController";

    private static final String ADD_TO_CART = "Add_To_Cart";
    private static final String ADD_TO_CART_CONTROLLER = "AddToCartController";

    private static final String EDIT_EMP_PROFILE_PAGE = "EditEmpProfilePage";
    private static final String EDIT_EMP_PROFILE_PAGE_VIEW = "AD_EditProfile.jsp";

    private static final String EDIT_EMP_PROFILE = "EditEmpProfile";
    private static final String EDIT_EMP_PROFILE_CONTROLLER = "EditEmployeeProfileController";

    private static final String WEB_STATISTIC_PAGE = "Statistic";
    private static final String WEB_STATISTIC_PAGE_VIEW = "AD_Statistic.jsp";
    
    private static final String VIEW_CART = "View_Cart";
    private static final String VIEW_CART_CONTROLLER = "ViewCartController";
    
    private static final String REMOVE_FROM_CART = "RemoveFromCart";
    private static final String REMOVE_FROM_CART_CONTROLLER = "RemoveFromCartController";
    
    private static final String UPDATE_CART_QUANTITY = "UpdateCartQuantity";
    private static final String UPDATE_CART_QUANTITY_CONTROLLER = "UpdateCartQuantityController";
    
    private static final String FIND_PRODUCT = "FindProduct";
    private static final String FIND_PRODUCT_CONTROLLER = "SearchProductForHeaderController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = WELCOME;
        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (REGISTER_PAGE.equals(action)) {
                url = REGISTER_PAGE_VIEW;
            } else if (REGISTER.equals(action)) {
                url = REGISTER_CONTROLLER;
            } else if (SENDMAIL.equals(action)) {
                url = SEND_EMAIL_CONTROLLER;
            } else if (REPLY_SUPPORT.equals(action)) {
                url = SEND_EMAIL_REPLY_SUPPORT;
            } else if (ADD_PRODUCT.equals(action)) {
                url = ADD_PRODUCT_CONTROLLER;
            } else if (VIEW_SUPPORT_PAGE.equals(action)) {
                url = VIEW_SUPPORT_PAGE_CONTROLLER;
            } else if (GET_SUPPORT_LIST.equals(action)) {
                url = GET_SUPPORT_LIST_CONTROLLER;
            } else if (SEARCH_SUPPORT.equals(action)) {
                url = SEARCH_SUPPORT_CONTROLLER;
            } else if (REPLY_SUPPORT_PAGE.equals(action)) {
                url = REPLY_SUPPORT_PAGE_VIEW;
            } else if (BACK_SUPPORT_PAGE.equals(action)) {
                url = BACK_SUPPORT_PAGE_VIEW;
            } else if (ADD_PRODUCT_PAGE.equals(action)) {
                url = ADD_PRODUCT_PAGE_VIEW;
            } else if (ADD_BRAND.equals(action)) {
                url = ADD_BRAND_CONTROLLER;
            } else if (SEARCH_BRAND.equals(action)) {
                url = SEARCH_BRAND_CONTROLLER;
            } else if (DELETE_BRAND.equals(action)) {
                url = DELETE_BRAND_CONTROLLER;
            } else if (ADD_BRANDS_PAGE.equals(action)) {
                url = ADD_BRANDS_PAGE_VIEW;
            } else if (GET_BRANDS_PAGE.equals(action)) {
                url = GET_BRANDS_PAGE_VIEW;
            } else if (EDIT_BRAND_PAGE.equals(action)) {
                url = EDIT_BRAND_PAGE_VIEW;
            } else if (ADD_PROMOTION.equals(action)) {
                url = ADD_PROMOTION_CONTROLLER;
            } else if (SEARCH_PROMOTION.equals(action)) {
                url = SEARCH_PROMOTION_CONTROLLER;
            } else if (EDIT_PROMOTION.equals(action)) {
                url = EDIT_PROMOTION_PAGE;
            } else if (SAVE_EDIT_PROMOTION.equals(action)) {
                url = EDIT_PROMOTION_CONTROLLER;
            } else if (DELETE_PROMOTION.equals(action)) {
                url = DELETE_PROMOTION_CONTROLLER;
            } else if (VIEW_PROMOTION_DETAIL.equals(action)) {
                url = VIEW_PROMOTION_DETAIL_CONTROLLER;
            } else if (ADD_CATEGORY_PAGE.equals(action)) {
                url = ADD_CATEGORY_PAGE_VIEW;
            } else if (ADD_CATEGORY.equals(action)) {
                url = ADD_CATEGORY_CONTROLLER;
            } else if (ADD_CHILDREN_CATEGORY_PAGE.equals(action)) {
                url = ADD_CHILDREN_CATEGORY_PAGE_VIEW;
            } else if (ADD_CHILDREN_CATEGORY.equals(action)) {
                url = ADD_CHILDREN_CATEGORY_CONTROLLER;
            } else if (SEARCH_CATEGORY_PAGE.equals(action)) {
                url = SEARCH_PAGE_VIEW;
            } else if (SEARCH_CATEGORY.equals(action)) {
                url = SEARCH_CATEGORY_CONTROLLER;
            } else if (ADD_EMPLOYEE.equals(action)) {
                url = ADD_EMPLOYEE_CONTROLLER;
            } else if (ADD_EMPLOYEE_PAGE.equals(action)) {
                url = ADD_EMPLOYEE_PAGE_VIEW;
            } else if (EDIT_CHILDRENCATEGORY.equals(action)) {
                url = EDIT_CHILDRENCATEGORY_CONTROLLER;
            } else if (EDIT_CATEGORY.equals(action)) {
                url = EDIT_CATEGORY_CONTROLLER;
            } else if (SEARCH_ORDER_PAGE.equals(action)) {
                url = SEARCH_ORDER_VIEW;
            } else if (SEARCH_ORDER.equals(action)) {
                url = SEARCH_ORDER_CONTROLLER;
            } else if (EDIT_ORDER.equals(action)) {
                url = EDIT_ORDER_CONTROLLER;
            } else if (DELETE_ORDER.equals(action)) {
                url = EDIT_ORDER_CONTROLLER;
            } else if (EDIT_ORDER.equals(action)) {
                url = EDIT_ORDER_CONTROLLER;
            } else if (GET_ORDER_LIST.equals(action)) {
                url = GET_ORDER_LIST_CONTROLLER;
            } else if (BACK_ORDER_LIST.equals(action)) {
                url = GET_ORDER_LIST_CONTROLLER;
            } else if (EDIT_ORDER_PAGE.equals(action)) {
                url = EDIT_ORDER_PAGE_VIEW;
            } else if (VIEW_ORDER.equals(action)) {
                url = VIEW_ORDER_CONTROLLER;
            } else if (DELETE_CATEGORY.equals(action)) {
                url = DELETE_CATEGORY_CONTROLLER;
            } else if (DELETE_CHILDREN_CATEGORY.equals(action)) {
                url = DELETE_CHILDREN_CATEGORY_CONTROLLER;
            } else if (FORGOT_PASSWORD_PAGE.equals(action)) {
                url = FORGOT_PASSWORD_CONTROLLER;
            } else if (VERIFY_TOKEN.equals(action)) {
                url = VERIFY_TOKEN_CONTROLLER;
            } else if (SEARCH_USER.equals(action)) {
                url = SEARCH_USER_CONTROLLER;
            } else if (EDIT_CUSTOMER_PAGE.equals(action)) {
                url = EDIT_CUSTOMER_PAGE_VIEW;
            } else if (EDIT_CUSTOMER.equals(action)) {
                url = EDIT_CUSTOMER_CONTROLLER;
            } else if (EDIT_EMPLOYEE_PAGE.equals(action)) {
                url = EDIT_EMPLOYEE_PAGE_VIEW;
            } else if (EDIT_EMPLOYEE.equals(action)) {
                url = EDIT_EMPLOYEE_CONTROLLER;
            } else if (GET_PRODUCT_PAGE.equals(action)) {
                url = GET_PRODUCT_PAGE_VIEW;
            } else if (SEARCH_PRODUCT.equals(action)) {
                url = SEARCH_PRODUCT_CONTROLLER;
            } else if (DELETE_PRODUCT.equals(action)) {
                url = DELETE_PRODUCT_CONTROLLER;
            } else if (EDIT_PRODUCT.equals(action)) {
                url = EDIT_PRODUCT_CONTROLLER;
            } else if (ADD_PRODUCT_DETAILS.equals(action)) {
                url = ADD_PRODUCT_DETAILS_CONTROLLER;
            } else if (SEARCH_PRODUCT_PAGE.equals(action)) {
                url = SEARCH_PRODUCT_PAGE_VIEW;
            } else if (DELETE_DETAILS.equals(action)) {
                url = DELETE_DETAILS_CONTROLLER;
            } else if (EDIT_PRODUCT_DETAILS.equals(action)) {
                url = EDIT_PRODUCT_DETAILS_CONTROLLER;
            } else if (DELETE_USER.equals(action)) {
                url = DELETE_USER_CONTROLLER;
            } else if (VIEW_PRIVACY.equals(action)) {
                url = VIEW_PRIVACY_CONTROLLER;
            } else if (MANAGE_PROMOTION_PAGE.equals(action)) {
                url = MANAGE_PROMOTION_PAGE_VIEW;
            } else if (GET_PRODUCTS_PAGE.equals(action)) {
                url = GET_PRODUCTS_PAGE_VIEW;
            } else if (GET_PRODUCT_DETAIL.equals(action)) {
                url = GET_PRODUCT_DETAIL_CONTROLLER;
            } else if (ADD_PRODUCT_DETAIL_PAGE.equals(action)) {
                url = ADD_PRODUCT_DETAIL_PAGE_VIEW;
            } else if (CATEGORY.equals(action)) {
                url = CATEGORY_CONTROLLER;
            } else if (WISHLIST.equals(action)) {
                url = WISHLIST_CONTROLLER;
            } else if (DELETE_WISHLIST.equals(action)) {
                url = DELETE_WISHLIST_CONTROLLER;
            } else if (CHECK_OUT_PAGE.equals(action)) {
                url = VIEW_CHECKOUT_CONTROLLER;
            } else if (PLACE_ORDER.equals(action)) {
                url = CHECKOUT_CONTROLLER;
            } else if (VIEW_PROFILE.equals(action)) {
                url = VIEW_PROFILE_CONTROLLER;
            } else if (EDIT_PROFILE.equals(action)) {
                url = EDIT_PROFILE_CONTROLLER;
            } else if (SAVE_PROFILE.equals(action)) {
                url = SAVE_PROFILE_CONTROLLER;
            } else if (VIEW_PROMOTION.equals(action)) {
                url = VIEW_PROMOTION_CONTROLLER;
            } else if (GET_CATEGORY_INFO.equals(action)) {
                url = GET_CATEGORY_INFO_CONTROLLER;
            } else if (SEARCH_CHILDREN_CATEGORY.equals(action)) {
                url = SEARCH_CHILDREN_CATEGORY_CONTROLLER;
            } else if (GET_CHILDREN_CATEGORY_INFO.equals(action)) {
                url = GET_CHILDREN_CATEGORY_INFO_CONTROLLER;
            } else if (HISTORY.equals(action)) {
                url = HISTORY_CONTROLLER;
            } else if (ADD_WISHLIST.equals(action)) {
                url = ADD_WISHLIST_CONTROLLER;
            } else if (GET_USER_INFO.equals(action)) {
                url = GET_USER_INFO_CONTROLLER;
            } else if (REQUEST_FOR_SUPPORT.equals(action)) {
                url = REQUEST_FOR_SUPPORT_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (GET_PRODUCTBYID.equals(action)) {
                url = GET_PRODUCTBYID_CONTROLLER;
            } else if (GET_PRODUCT_BY_BRAND.equals(action)) {
                url = GET_PRODUCT_BY_BRAND_CONTROLLER;
            } else if (GET_PRODUCT_BY_PRICES.equals(action)) {
                url = GET_PRODUCT_BY_PRICE_CONTROLLER;
            } else if (EDIT_PRODUCT_PAGE.equals(action)) {
                url = EDIT_PRODUCT_PAGE_VIEW;
            } else if (PROMOTION_CHECKER.equals(action)) {
                url = PROMOTION_CHECKER_CONTROLLER;
            } else if (ALL_PRODUCT.equals(action)) {
                url = ALL_PRODUCT_PAGE;
            } else if (EDIT_PRODUCT_DETAIL_PAGE.equals(action)) {
                url = EDIT_PRODUCT_DETAIL_PAGE_VIEW;
            } else if (VIEW_US_ORDER.equals(action)) {
                url = VIEW_US_ORDER_CONTROLLER;
            } else if (VIEW_US_ORDER_DETAIL.equals(action)) {
                url = VIEW_US_ORDER_DETAIL_CONTROLLER;
            } else if (CANCEL_ORDER.equals(action)) {
                url = CANCEL_ORDER_CONTROLLER;
            } else if (ADD_TO_CART.equals(action)) {
                url = ADD_TO_CART_CONTROLLER;
            } else if (EDIT_EMP_PROFILE_PAGE.equals(action)) {
                url = EDIT_EMP_PROFILE_PAGE_VIEW;
            } else if (EDIT_EMP_PROFILE.equals(action)) {
                url = EDIT_EMP_PROFILE_CONTROLLER;
            } else if (VIEW_CART.equals(action)) {
                url = VIEW_CART_CONTROLLER;
            } else if (REMOVE_FROM_CART.equals(action)) {
                url = REMOVE_FROM_CART_CONTROLLER;
            } else if (UPDATE_CART_QUANTITY.equals(action)) {
                url = UPDATE_CART_QUANTITY_CONTROLLER;
            } else if (FIND_PRODUCT.equals(action)) {
                url = FIND_PRODUCT_CONTROLLER;
            }
        } catch (Exception e) {
            log("error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
