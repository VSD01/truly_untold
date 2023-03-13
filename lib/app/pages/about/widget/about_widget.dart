import 'package:flutter/material.dart';
import 'package:practise1/app/app.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 30 : 180,
        ),
        child: Row(
          children: [
            webProfileSection(),
            Dimens.boxWidth10,
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Dimens.boxWidth10,
            webProfileSection(),
          ],
        ),
      ),
    ));
  }
}

Widget webProfileSection() {
  return Expanded(
    child: Container(
      color: Color(0xffcccccc),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Creator',
              style: AppTextStyle.black_20_700,
            ),
            const Divider(
              color: Colors.black,
            ),
            Container(
              height: Dimens.fourty,
              width: Dimens.fourty,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white)),
            ),
            Dimens.boxHeight2,
            Text(
              'Vishal Sisodia',
              style: AppTextStyle.black_20_700,
            ),
            Dimens.boxHeight2,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
              'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,'
              ' when an unknown printer took a galley of type and scrambled it to make a type '
              ' specimen book. It has survived not only five centuries, but also the leap into '
              ' electronic typesetting, remaining essentially unchanged. It was popularised in '
              ' the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,'
              '  and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.,',
              textAlign: TextAlign.center,
              style: AppTextStyle.black_17_400,
            ),
          ],
        ),
      ),
    ),
  );
}
