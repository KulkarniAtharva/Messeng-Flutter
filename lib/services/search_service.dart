import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService
{
  /* searchByName(String searchField) async
   {
    return await Firestore.instance.collection("users").where("userName",
        isEqualTo: searchField.toLowerCase()).getDocuments();
  }*/

  searchByName(String searchField)
  {
    return FirebaseFirestore.instance
        .collection('users')
        .where('userName', isEqualTo: searchField)
        .get();
  }

  getChatRoomsByUserName(String userName)
  {
    return FirebaseFirestore.instance
        .collection('chatRooms')
        .where('users', arrayContains: userName)
        .get();
  }
}