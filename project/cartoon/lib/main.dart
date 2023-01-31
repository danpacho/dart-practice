import 'package:cartoon/widgets/Button.dart';
import 'package:cartoon/widgets/wallet_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 24, 24, 24),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.terrain_sharp,
                      color: Colors.white,
                      size: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          "Hey, june",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Welcome back!",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 120,
                ),
                Text(
                  "Total Balance",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "\$5 194 482",
                  style: TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: -3,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Button(
                      text: "Transfer",
                      backgroundColor: Colors.amber,
                      color: Colors.black,
                    ),
                    Button(
                      text: "Request",
                      backgroundColor: Color.fromARGB(255, 42, 42, 42),
                      color: Colors.white,
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Wallets",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const WalletCard(
                  walletTitle: "Euro",
                  country: Country.eur,
                  currencyAmount: "6 428\$",
                  style: CardStyle.black,
                  icon: Icons.euro_rounded,
                ),
                const WalletCard(
                  walletTitle: "Korea",
                  country: Country.kor,
                  currencyAmount: "6 428w",
                  style: CardStyle.white,
                  icon: Icons.currency_bitcoin,
                  stackLevel: -30,
                ),
                const WalletCard(
                  walletTitle: "US",
                  country: Country.usd,
                  currencyAmount: "6 428\$",
                  style: CardStyle.black,
                  icon: Icons.currency_franc,
                  stackLevel: -60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
