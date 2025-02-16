import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 38,
            backgroundColor: color,
          );
  }
}

class ClolorsListView extends StatefulWidget {
  const ClolorsListView({super.key, required this.isActive});
  final bool isActive;

  @override
  State<ClolorsListView> createState() => _ClolorsListViewState();
}

class _ClolorsListViewState extends State<ClolorsListView> {
  int currentIndex = 0;
  List<Color> colors = const [
    // Blues
    Color(0xff072AC8), // أزرق نيلي غامق
    Color(0xff007AED), // أزرق متوسط
    Color(0xff00A0ED), // أزرق سماوي
    Color(0xff86CFFC), // أزرق فاتح
    Color(0xffA2D6F9), // أزرق سماوي فاتح

    // Greens
    Color(0xff006400), // أخضر داكن
    Color(0xff228B22), // أخضر غامق
    Color(0xff4CAF50), // أخضر فاتح
    Color(0xff32CD32), // أخضر ليموني

    // Yellows and Oranges
    Color(0xffFCF300), // أصفر فاتح
    Color(0xffFFC600), // أصفر ذهبي
    Color(0xffF39B17), // برتقالي فاتح
    Color(0xffF36C00), // برتقالي غامق
    Color(0xffFF4500), // أحمر برتقالي

    // Reds
    Color(0xffC41B35), // أحمر غامق
    Color(0xff8B0000), // أحمر داكن
    Colors.red, // أحمر قياسي

    // Purples
    Color(0xff4B0082), // نيلي
    Color(0xff800080), // بنفسجي

    // Teals
    Color(0xff00CED1), // فيروزي
    Color(0xff40E0D0), // فيروزي فاتح
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      width: double.infinity,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                setState(() {});
              },
              child: ColorItem(
                color: colors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
