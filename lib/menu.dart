import 'package:atm_program_with_gui/check_balance.dart';
import 'package:flutter/material.dart';
import 'change_pin.dart';
import 'main.dart';

void main() {
  runApp(const MainMenu());
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //BACKGROUND COLOR FOR THE MENU
        backgroundColor: const Color.fromRGBO(232, 230, 226, 1),

        //START OF NAV BAR
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(1, 109, 47, 1),
          foregroundColor: Colors.white,
          elevation: 4,
          title: const Text('ATM APPLICATION'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                // open menu
              },
              icon: const Icon(Icons.menu)),
          actions: [
            IconButton(
                onPressed: () {
                  // open profile
                },
                icon: const Icon(Icons.person))
          ],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )),
        ),
        //END OF NAV BAR

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Banking Services",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromRGBO(32, 32, 32, 1),
                  ),
                ),
              ),
              const SizedBox(height: 30), // Space below the title

              // Card 1 - Check Balance
              Expanded(
                child: Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context); // Close the menu screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CheckBalance()),
                      );
                    },
                    child: const SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center the Row
                        children: [
                          Icon(Icons.account_balance,
                              color: Color.fromRGBO(
                                  1, 109, 47, 1)), // Icon for Check Balance
                          SizedBox(width: 10), // Space between icon and text
                          Text(
                            'Check Balance',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(1, 109, 47, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Card 2 - Withdraw Money
              Expanded(
                child: Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {},
                    child: const SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center the Row
                        children: [
                          Icon(Icons.money_off,
                              color: Color.fromRGBO(
                                  1, 109, 47, 1)), // Icon for Withdraw Money
                          SizedBox(width: 10), // Space between icon and text
                          Text(
                            'Withdraw Money',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(1, 109, 47, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Card 3 - Deposit Money
              Expanded(
                child: Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {},
                    child: const SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center the Row
                        children: [
                          Icon(Icons.attach_money,
                              color: Color.fromRGBO(
                                  1, 109, 47, 1)), // Icon for Deposit Money
                          SizedBox(width: 10), // Space between icon and text
                          Text(
                            'Deposit Money',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(1, 109, 47, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Card 4 - Transfer Money
              Expanded(
                child: Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {},
                    child: const SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center the Row
                        children: [
                          Icon(Icons.transfer_within_a_station,
                              color: Color.fromRGBO(
                                  1, 109, 47, 1)), // Icon for Transfer Money
                          SizedBox(width: 10), // Space between icon and text
                          Text(
                            'Transfer Money',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(1, 109, 47, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Card 5 - Pay Bills
              Expanded(
                child: Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {},
                    child: const SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center the Row
                        children: [
                          Icon(Icons.receipt_long,
                              color: Color.fromRGBO(
                                  1, 109, 47, 1)), // Icon for Pay Bills
                          SizedBox(width: 10), // Space between icon and text
                          Text(
                            'Pay Bills',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(1, 109, 47, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Card 6 - Change PIN
              Expanded(
                child: Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context); //Close the menu
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChangePIN()),
                      );
                    },
                    child: const SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center the Row
                        children: [
                          Icon(Icons.lock,
                              color: Color.fromRGBO(
                                  1, 109, 47, 1)), // Icon for Change PIN
                          SizedBox(width: 10), // Space between icon and text
                          Text(
                            'Change PIN',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(1, 109, 47, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Card 7 - Exit
              Expanded(
                child: Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context); // Close the menu screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyApp()),
                      );
                    },
                    child: const SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center the Row
                        children: [
                          Icon(Icons.exit_to_app,
                              color: Color.fromRGBO(
                                  1, 109, 47, 1)), // Icon for Exit
                          SizedBox(width: 10), // Space between icon and text
                          Text(
                            'Exit',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(1, 109, 47, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
