const String host = "https://www.eazytechno.com/biocellar/admin/webservices";
// get
const String fetchTable = "$host/api_tables.php";
// get
const String pincodeApi = "http://www.postalpincode.in/api/pincode";
// example ?category=[2,7]&brand=[]&price=[100,250];
const String filterApi = "$host/filter_data.php";
// post
const String editAddressApi = "$host/edit_address.php";
// get
const String getUserAddresses = "$host/get_user_addresses.php";
// post
const String signUpApi = "$host/signup.php";
// post
const String saveAddressApi = "$host/save_address.php";
const String logInApi = "$host/login.php";
const String deleteUserApi = "$host/delete_user.php";
const String submitOrderApi = "$host/createOrder.php";
// post user_id
const String getUserOrdersApi = "$host/getOrders.php";
// post user_id
const String getProductMoreDetails = "$host/getProductDetails.php";
const String submitBulkOrderApi = "$host/createBulkOrder.php";
const String updateUserProfileApi = "$host/updateProfile.php";
const String submitUserReviewApi = "$host/createUserReview.php";

/// ----------------------------------------------------------------[parameters]
const String params1 = "/?table_name";
const String pCategory = "?category";
const String pBrand = "&brand";
const String pPrice = "&price";
const String pDiscount = "&discount";
const String pRating = "&rating";
const String pUserId = "?user_id";
