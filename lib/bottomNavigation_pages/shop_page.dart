import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 2, right: 2, bottom: 10, top: 10),
              child: Container(
                // height: MediaQuery.of(context).size.shortestSide,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Image.asset(
                  "assets/images/buycar.png",
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Top Selling ----------------------------------------",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            // VerticalDivider(
            //   color: Colors.black,
            //   thickness: 1,
            //   width: 20,
            //   indent: 5,
            //   endIndent: 5,
            // ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 270,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Image.asset(
                          "assets/images/hundai.png",
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          "assets/images/tata.png",
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 20),
                        Image.asset(
                          "assets/images/mg.png",
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 20),
                        Image.asset(
                          "assets/images/mahi.png",
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),

            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
                  backgroundColor: const Color.fromARGB(255, 81, 177, 91),
                ),
                child: const Text(
                  "Book Car",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
