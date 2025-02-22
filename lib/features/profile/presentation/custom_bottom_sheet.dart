import 'package:flutter/material.dart';

/// **CustomBottomSheet** - Ein universelles BottomSheet mit abgerundeten Ecken & Swipe-Geste
class CustomBottomSheet extends StatelessWidget {
  final Widget child; // Inhalt des BottomSheets

  const CustomBottomSheet({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85, // 85% der Bildschirmhöhe
      minChildSize: 0.5,
      maxChildSize: 0.85,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
          ),
          child: Column(
            children: [
              /// **Drag-Handle für Swipe-Geste**
              Container(
                width: 50,
                height: 5,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              /// **Inhalt des BottomSheets (wird dynamisch übergeben)**
              Expanded(child: child),
            ],
          ),
        );
      },
    );
  }
}

/// **Funktion zum Öffnen eines Custom BottomSheets**
void showCustomBottomSheet(BuildContext context, Widget content) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
    ),
    builder: (context) => CustomBottomSheet(child: content),
  );
}
