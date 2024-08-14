class EndPoint {
  static String baseUrl = "http://10.0.2.2:8000/api/";
  static String signin = "login";
  static String signup = "register";
  static String getuserDataEndPoint(String id) {
    print("enter method");
    return "user/$id";
  }

  static String logout = "logout";
  static String createPosts = "posts";
}

class ApiKey {
  static String status = "status";
  static String message = "message";

// login
  static String bio = "bio";
  static String image = "image";

  //sign up
  static String data = "data";
  static String user = "user";
  static String id = "id";
  static String name = "name";
  static String email = "email";
  static String email_verified_at = "email_verified_at"; //null
  static String created_at = "created_at"; // null
  static String password = "password";
  static String updated_at = "updated_at"; //null
  static String token = "token";

// user info

  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profilePic";



    //get all posts or create post
  static String title = "title";
  static String PostContent = "postContent";
  static String PostImage = "image";
  static String user_id = "user_id";
  static String tag_comment = "tagComment";

 
}