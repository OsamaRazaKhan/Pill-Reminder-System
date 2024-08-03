import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pill_reminder_system/Utilities/Global/global.dart';

class User
{
  late String fname,lname,email,password;
  late int id;
  User.Cons1();
  User(this.id,this.fname,this.lname);
  User.fromMap(Map<String,dynamic> map)
  {   
    email=map["email"];
    password=map["password"];
    fname=map["fname"];
    lname=map["lname"];
    id=map["id"];
    

  }
  Map<String,dynamic> tomap()
  {
    return <String,dynamic>{
      'email':email,
      'password':password,
      'fname':fname,
      'lname':lname,
    };

  }
   static Future<List<User>> getVehicles()
  {
    List<User> ulist = [];
    User u = new User(4,'Muhammed', 'Osama');
    ulist.add(u);
    u = new User(4,'Muhammed', 'Tahir');    ulist.add(u);
    Future<List<User>> vdata = Future.value(ulist);
    return vdata;
  }
  
  Future<String?> login(String st) async
  {
    // print('Good work2');
    print(email);
    print(password);
    String? url;
    if(st=='Care Taker')
    {
        //  print('Good work3 for Care Taker');
         url='${ip2}/caretaker/login?email=${email}&password=${password}';
    }
     
    else if(st=='Doctor')
      {
        print('Good work3 for doctor');
         url='${ip2}/doctor/login?email=${email}&password=${password}';
      }
       else if(st=='Patient')
      {
         print('Good work3 for patient');
         url='${ip2}/patient/login?email=${email}&password=${password}';
      }

    Uri uri=Uri.parse(url!); 
    // print('Good work4'); 
    var response  =  await http.get(uri);  
     print('Good work4 for patient');
     //print('Good work2');
    if(response.statusCode==200)
    {
     //   print('Good work3');
        return response.body;
        
    }

         return null;
  }

    Future<String?> CheckPriority(int cid, int pid) async
  {
      print('forPriorityChk body2');
    String? url;

      print('forPriorityChk body3');
         url='${ip2}/caretaker/CheckPriority?cid=${cid}&pid=${pid}';
  

    Uri uri=Uri.parse(url); 
      print('forPriorityChk body4');
    var response  =  await http.get(uri);  
    print(response);
     //print('Good work2');
    if(response.statusCode==200)
    {
     //   print('Good work3');
        return response.body;
        
    }

         return null;
  }
    Future<String?> CheckStatus(int cid, int pid) async {
    print('Good work2');
    String? url;

    print('Good work3 for Care Taker');
    url = '${ip2}/caretaker/CheckStatus?cid=${cid}&pid=${pid}';

    Uri uri = Uri.parse(url);
    print('Good work4');
    var response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      print("success message");
      return response.body;
    }

    return null;
  }
    Future<String?> CheckStatus2(int cid, int pid) async {
    print('Good work2');
    String? url;

    print('Good work3 for Care Taker');
    url = '${ip2}/caretaker/CheckStatus2?cid=${cid}&pid=${pid}';

    Uri uri = Uri.parse(url);
    print('Good work4');
    var response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      print("success message");
      return response.body;
    }

    return null;
  }
      Future<String?> ChangeStatus(int cid, int pid) async
  {
    print("change status body2");
    String? url;

         url='${ip2}/caretaker/changestatus?cid=${cid}&pid=${pid}';
  

    Uri uri=Uri.parse(url); 
    print("change status body3");
    var response  =  await http.post(uri);  
    print("change status body4");
    print(response.body);
     //print('Good work2');
    if(response.statusCode==200)
    {
     //   print('Good work3');
        return response.body;
        
    }

         return response.body;
  }

    Future<String?> ChangeStatus2(int cid, int pid) async
  {
    print("change status2 body2");
    String? url;

         url='${ip2}/caretaker/changestatus2?cid=${cid}&pid=${pid}';
  

    Uri uri=Uri.parse(url); 
    print("change status2 body3");
    var response  =  await http.post(uri);  
    print("change status2 body4");
    print(response.body);
     //print('Good work2');
    if(response.statusCode==200)
    {
     //   print('Good work3');
        return response.body;
        
    }

         return response.body;
  }

      Future<String?> ChangeState(int pid,String st) async
  {
    print("change status body2");
    String? url;

         url='${ip2}/patient/changestate?pid=${pid}&st=${st}';
  

    Uri uri=Uri.parse(url); 
    print("change status body3");
    var response  =  await http.post(uri);  
    print("change status body4");
    print(response.body);
     //print('Good work2');
    if(response.statusCode==200)
    {
     //   print('Good work3');
        return response.body;
        
    }

         return response.body;
  }
       Future<String?> ChangeState2(int pid,String st) async
  {
    print("change state body2");
    String? url;

         url='${ip2}/patient/changestate2?pid=${pid}&st=${st}';
  

    Uri uri=Uri.parse(url); 
    print("change state body3");
    var response  =  await http.post(uri);  
    print("change state body4");
    print(response.body);
     //print('Good work2');
    if(response.statusCode==200)
    {
     //   print('Good work3');
        return response.body;
        
    }

         return response.body;
  }
  Future<String?> signupQuery()async{
    String? url='${ip2}/user/CreateNewAccount?email=${email}&password=${password}&role=${fname}';
    Uri uri=Uri.parse(url);
    var reseponse =await  http.post(uri);  
       if(reseponse.statusCode==200)
       {
          print('Good work1');  
          return reseponse.body; 
       }
         

       return null;
  
  }
  Future<String?> GetPatients(int uid,String type)async{
    String url;
    // print('get patients body1');
    
     if (type=='Doctor')
      url='${ip2}/doctor/getpatients?uid=${uid}';
    else
      url='${ip2}/caretaker/getpatients?uid=${uid}';

    Uri uri=Uri.parse(url);
    // print('get patients body2');
    var reseponse =await  http.get(uri);  
    // print('get patients body3');
       if(reseponse.statusCode==200)
       {
        // print('get patients body4');
        // print('Good work1');  
        return reseponse.body; 
       }
       return null;  
  }
    Future<String?> GetDoctors(String type)async{
    String url;
    print('get doctors body1');

      if(type=='doctor')
      url='${ip2}/doctor/getdoctors';
      
      else url='${ip2}/caretaker/getcaretakers';

    Uri uri=Uri.parse(url);
    print('get doctors body2');
    var reseponse =await  http.get(uri);  
    print('get doctors body3');
       if(reseponse.statusCode==200)
       {
        print('get doctors body4');
        print('Good work1');  
        return reseponse.body; 
       }
       return null;  
  }
  Future<String?> signupObject(String st)async{
    late Uri uri;
    print('good work2'); 
    if(st=='Care Taker')
    {
        String url='${ip2}/caretaker/Signup';
        uri=Uri.parse(url);
    }
     
    else if(st=='Doctor')
      {
         String url='${ip2}/doctor/Signup';
        uri=Uri.parse(url);
      }
       else if(st=='Patient')
      {
         String url='${ip2}/patient/Signup';
         uri=Uri.parse(url);
      }
  //  var body=jsonEncode(<String,dynamic>{
  //   'email':email,
  //   'password':password,
  //   'role':role
  //  });                   
       print('good work3'); 
       var reseponse =await   http.post(uri,
                                        body:jsonEncode(tomap()),
                                        headers: <String,String>{
                                          'Content-Type':'application/json'   
                                        });   
    
       print('good work4');  
                              
       if(reseponse.statusCode==200) {
       if(reseponse.body.contains("Created"))
         {
            return "Created";
         } 
         else if(reseponse.body.contains("Exsist"))
          {
            return "Exsist";
          }
       } 
       return null;
  
  }
  Future<String?> signupMutliPart()async{
    String url='${ip2}/user/NewAccount';   
      var request   = http.MultipartRequest('POST',Uri.parse(url));
      request.fields['email']=email;
      request.fields['password']=password;
      request.fields['role']=fname;
        var response=await request.send(); 
        if(response.statusCode==200)
           return response.stream.bytesToString();
        return null;
  }
  Future<String?> uploadPic(File f)async
  {
    String url='${ip2}/user/UpdateProfileImage';

    Uri uri=Uri.parse(url);
    var request= http.MultipartRequest('POST',uri);
    request.fields["Id"]=id.toString();
    http.MultipartFile newfile=await http.MultipartFile.fromPath('photo',f.path);
    request.files.add(newfile);
    var response=await request.send();

    print('Good Work2');
    if(response.statusCode==200)
    return 'Uploaded';    

    return null;

  }

}










