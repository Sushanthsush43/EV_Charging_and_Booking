import 'package:flutter/material.dart';

class UserProfileNavBar extends StatelessWidget {
  UserProfileNavBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(""),
                  accountEmail: Text(""),
                  currentAccountPicture: CircleAvatar(
                    child: ClipOval(
                      child: Image.asset(
                        "",
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 81, 177, 91),
                    image: DecorationImage(
                      image: AssetImage("assets/images/plant.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  leading: Icon(
                    Icons.person_2_outlined,
                    color: Color.fromARGB(255, 0, 0, 0),
                    size: 35,
                  ),
                  title: Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  leading: Icon(
                    Icons.local_grocery_store_outlined,
                    color: Color.fromARGB(255, 0, 0, 0),
                    size: 35,
                  ),
                  title: Text(
                    "Orders",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  leading: Icon(
                    Icons.wallet,
                    color: Color.fromARGB(255, 0, 0, 0),
                    size: 35,
                  ),
                  title: Text(
                    "Wallet",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_balance_outlined,
                    color: Color.fromARGB(255, 0, 0, 0),
                    size: 35,
                  ),
                  title: Text(
                    "Transactions",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 10),
              ),
              child: Text(
                'LogOut',
                style: TextStyle(
                    color: Color.fromARGB(255, 81, 177, 91),
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
