import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/auth/googlesign.dart';
import 'package:quiz/screens/ques_scr.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Stack(
      children: [
        Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text("All Quizes"),
            centerTitle: true,
            backgroundColor: Colors.pinkAccent,
          ),
          drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
           UserAccountsDrawerHeader(
              accountName: Text(
                  user.displayName,style: const TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white)
              ),
              accountEmail: Text(user.email),
              currentAccountPicture: CircleAvatar(
                child: Text(user.displayName[0], style: const TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.white)),
                backgroundColor: Colors.black87,
              ),
              decoration: const BoxDecoration(
                color: Colors.amberAccent,
              ),
            ),
            ListTile(
                leading: const Icon(Icons.power_settings_new),
                title: const Text('Log Out'),
                onTap: () async{
                  final provider = Provider.of<GoogleSignInProvider>(context , listen: false);
                  provider.logOut();
                },
              ),
          ],
        ),
      ),
          body: Stack(
            children: [
              SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    Text(
                      "Let's Play The Quiz",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    // const Text(
                    //   "Enter Your Info. Below",
                    //   style: TextStyle(color: Colors.white),
                    // ),
                    // const Spacer(),
                    // const TextField(
                    //   decoration: InputDecoration(
                    //       filled: true,
                    //       fillColor: Colors.white,
                    //       hintText: "Enter Your Name",
                    //       icon: Icon(
                    //         Icons.account_circle_outlined,
                    //         color: Colors.white,
                    //       ),
                    //       border: OutlineInputBorder(
                    //         borderRadius:
                    //             BorderRadius.all(Radius.circular(20.0)),
                    //       )),
                    // ),
                    const Spacer(),
                    Center(
                      child: Container(
                        height: 55.0,
                        width: 300.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.black26, Colors.indigo.shade400],
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft),
                          border: Border.all(
                              color: Colors.black45, style: BorderStyle.solid),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: TextButton(
                          child: const Text(
                            "Start Quiz",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.amber,
                            ),
                          ),
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>const QuesScreen()));
                            Get.to(const QuesScreen());
                          },
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:quiz/screens/ques_scr.dart';
// import 'package:get/get.dart';


// class Home extends StatelessWidget {
//   const Home({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Scaffold(
//           backgroundColor: Colors.black,
//           appBar: AppBar(
//             title: const Text("All Quizes"),
//             centerTitle: true,
//             backgroundColor: Colors.pinkAccent,
//           ),
//           body: Stack(
//             children: [
//               SafeArea(
//                   child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Spacer(
//                       flex: 2,
//                     ),
//                     Text(
//                       "Let's Play The Quiz",
//                       style: Theme.of(context).textTheme.headline4.copyWith(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                     const Text(
//                       "Enter Your Info. Below",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     const Spacer(),
//                     const TextField(
//                       decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.white,
//                           hintText: "Enter Your Name",
//                           icon: Icon(
//                             Icons.account_circle_outlined,
//                             color: Colors.white,
//                           ),
//                           border: OutlineInputBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(20.0)),
//                           )),
//                     ),
//                     const Spacer(),
//                     Center(
//                       child: Container(
//                         height: 55.0,
//                         width: 300.0,
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                               colors: [Colors.black26, Colors.indigo.shade400],
//                               begin: Alignment.bottomRight,
//                               end: Alignment.topLeft),
//                           border: Border.all(
//                               color: Colors.black45, style: BorderStyle.solid),
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(20.0)),
//                         ),
//                         child: TextButton(
//                           child: const Text(
//                             "Start Quiz",
//                             style: TextStyle(
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.w700,
//                               color: Colors.amber,
//                             ),
//                           ),
//                           onPressed: () {
//                             // Navigator.push(context, MaterialPageRoute(builder: (context)=>const QuesScreen()));
//                             Get.to(const QuesScreen());
//                           },
//                         ),
//                       ),
//                     ),
//                     const Spacer(
//                       flex: 2,
//                     ),
//                   ],
//                 ),
//               )),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
