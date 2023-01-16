import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:infobash_admin/constants/constraints.dart';
import 'package:infobash_admin/screens/components/popup_dilog.dart';
import 'package:infobash_admin/screens/loginscreen.dart';
import 'package:infobash_admin/services/auth/signin_mannager.dart';
import 'package:provider/provider.dart';

class MenuDrawer extends StatelessWidget {
  MenuDrawer({
    Key? key,
  }) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: kPrimaryColordark),
              accountEmail: Text(user!.email.toString()),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage("assets/icons/app_icon.png"),
              ),
              accountName: const Text(""),
            ),

            Card(
              elevation: 0,
              child: ListTile(
                leading: const Icon(
                  Icons.person_outlined,
                  color: kPrimaryColordark,
                ),
                title: const Text('My Profile'),
                onTap: () async {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const ProfilePage()));
                },
              ),
            ),

            Card(
              elevation: 0,
              child: ListTile(
                leading: const Icon(
                  Icons.list_rounded,
                  color: kPrimaryColordark,
                ),
                title: const Text('My Appoinments'),
                onTap: () async {},
              ),
            ),
            // : Container(),
            Card(
              elevation: 0,
              child: ListTile(
                leading: const Icon(
                  Icons.password_outlined,
                  color: kPrimaryColordark,
                ),
                title: const Text('Change Password'),
                onTap: () {},
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                  leading: const Icon(
                    Icons.language_rounded,
                    color: kPrimaryColordark,
                  ),
                  title: const Text('Change Language'),
                  onTap: () {}),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                leading: const Icon(
                  Icons.help_outline_rounded,
                  color: kPrimaryColordark,
                ),
                title: const Text('Help'),
                onTap: () {},
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                leading: const Icon(
                  Icons.web,
                  color: kPrimaryColordark,
                ),
                title: const Text('About Us'),
                onTap: () {},
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                leading: const Icon(
                  Icons.contact_page_outlined,
                  color: kPrimaryColordark,
                ),
                title: const Text('Contact Us'),
                onTap: () async {},
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                leading: const Icon(
                  Icons.book_online_outlined,
                  color: kPrimaryColordark,
                ),
                title: const Text('Privacy & Policy'),
                onTap: () async {},
              ),
            ),

            Card(
              elevation: 0,
              child: ListTile(
                leading: const Icon(
                  Icons.logout_rounded,
                  color: kPrimaryColordark,
                ),
                title: const Text('Logout'),
                onTap: () {
                  PopupDialog.showPopuplogout(
                      context, "Signout", "Do you want to signout ? ",
                      () async {
                    // context.read<UserModel>().updateData(UserModel(
                    //     name: "", email: "", phone: "", role: "-1", date: ""));

                    await SigninManager().signOut();

                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LogInScreen()));
                    print("logingout");
                  });
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.2,
            ),
          ],
        ),
      ),
    );
  }
}
