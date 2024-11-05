class ApiConstant {
  static const _baseUrl = 'https://musestore.beauty/api';

  static const slidUrl = '$_baseUrl/offers?lang=ar';
  static const categoryUrl = '$_baseUrl/products/classifications?lang=ar';
  static const popularUrl = '$_baseUrl/products/best_selling_items?lang=ar';

  // Change this to create a function that returns the URL with the page number
  static String productForYouUrl(int pageNumber) {
    return '$_baseUrl/products/specially_for_you?lang=ar&itemsPerPage=20&page=$pageNumber';
  }
}
