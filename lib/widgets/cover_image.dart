import 'package:flutter/material.dart';

import '../core/constant/color_cons.dart';

class CoverImage extends StatelessWidget {
  const CoverImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 45, 0, 0),
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: ColorCons.secondPrimary,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.transparent,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          "assets/img/sacrifice.jpg",
                        ).image),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
      ],
    );
  }
}
