import 'package:flutter/material.dart';

enum Country { eur, usd, kor }

enum CardStyle { black, white }

class WalletCard extends StatelessWidget {
  final String walletTitle;
  final Country country;
  final String currencyAmount;
  final CardStyle style;
  final IconData icon;
  final double stackLevel;

  const WalletCard({
    super.key,
    required this.walletTitle,
    required this.country,
    required this.currencyAmount,
    required this.style,
    required this.icon,
    this.stackLevel = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, stackLevel),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.elliptical(25, 25),
            bottomRight: Radius.elliptical(25, 25),
            topLeft: Radius.elliptical(25, 25),
            topRight: Radius.elliptical(50, 50),
          ),
          color: style == CardStyle.black
              ? const Color.fromARGB(255, 43, 43, 43)
              : const Color.fromARGB(255, 239, 239, 239),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    walletTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 35,
                      color: style == CardStyle.black
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        currencyAmount,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: style == CardStyle.black
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        country.name.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: style == CardStyle.black
                              ? Colors.grey
                              : Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  // const Text("fd")
                ],
              ),
              Transform.scale(
                scale: 2.75,
                child: Transform.translate(
                  offset: const Offset(5, 5),
                  child: Icon(
                    icon,
                    color:
                        style == CardStyle.black ? Colors.white : Colors.black,
                    size: 80,
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
