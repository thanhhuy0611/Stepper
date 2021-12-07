import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stepper/data/helpers/firestore_helpers.dart';
import 'package:stepper/data/model/models.dart';

class PostService {
  final FirebaseFirestore firestore;

  PostService({required this.firestore});

  // save post to Firestore
  Future<void> savePost(Post post) async {
    final userDoc = await firestore.userDocument();
    await userDoc.postCollection.doc(post.postId).set(post.toJson());
  }

  // delete a post by Id
  Future<void> deletePost(String postId) async {
    final userDoc = await firestore.userDocument();
    await userDoc.postCollection.doc(postId).delete();
  }

  // check if post exists by post Id
  Future<bool> checkPostExist(String postId) async {
    final userDoc = await firestore.userDocument();
    final postSnapshot = await userDoc.postCollection.doc(postId).get();
    return postSnapshot.exists;
  }

  // listen to all post of a user
  Stream<List<Post>> watchAllPost() async* {
    final userDoc = await firestore.userDocument();
    yield* userDoc.postCollection
        .orderBy("postedTime", descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Post.fromJson(doc.data() as Map<String, dynamic>))
            .toList());
  }

  // get post by Id
  Future<Post> getPostById(String postId) async {
    final userDoc = await firestore.userDocument();
    final postSnapshot = await userDoc.postCollection.doc(postId).get();
    return Post.fromJson(postSnapshot.data() as Map<String, dynamic>);
  }

  // get draft post by area name
  Future<Post?> getDraftPostByAreaName(String areaName) async {
    final userDoc = await firestore.userDocument();
    final draftPostSnapshot =
        await userDoc.postCollection.doc('draft_$areaName').get();
    if (draftPostSnapshot.exists) {
      return Post.fromJson(draftPostSnapshot.data() as Map<String, dynamic>);
    } else {
      return null;
    }
  }
}
