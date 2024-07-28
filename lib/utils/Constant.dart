class Constants {
  static var appName = "Job Search";

  static const baseDomain =
      'https://ap-southeast-1.aws.data.mongodb-api.com/app';
  static const baseUrl = '$baseDomain/data-ddysq/endpoint/data/v1/';
  static const food_app_api_key =
      'PDJYvyGZ8HxdGdzdRzwiZrmBWmR7aTk38Z9Z38hgpxioo8i0cOthGr7jtqqhrYG3';


  static const applicationJson= 'application/json';

  static const isIntroDone = 'is_intro_done';
  static const isLoginDone = 'is_login_done';

  static const prefLogin = 'pref_login';

  static const assetImage = 'asset/images/';
    static const categoryImage = 'asset/categoryimage/';

  static const assetIcon = 'asset/icons/';
  static const assetRoot = 'asset/';

  static String USER_ID = '';
  static String LOGIN_TOKEN = '';

// ======================================
// dataSource


  static String data_source = "FutureDots";
// ======================================
// database


  static String data_base = "Receptoria";
// ======================================
// table


  static String login = "Login";

  static String recipe = "Recipe";
  static String category = "Category";
  static String popularCategory = "Popular Category";

    static String todayRecipe = "Today fresh recipe";


// ======================================
}

// Map<String, String> header = {
//   "content-type": "application/json",
//   Constants.api_key: Constants.food_app_api_key,
// };


  //  "dataSource": "FutureDots",
  //     "database": "Receptoria",
  //     "collection": "Recipe",