import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/songs_controller.dart';

class SortFilterBottomSheet extends StatelessWidget {
  const SortFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    SongsController songsController = Get.find();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
              blurRadius: 60.0,
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 50,
              offset: const Offset(0.0, -10.0)),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Wrap(
                direction: Axis.horizontal,
                spacing: 8,
                children: [
                  ChoiceChip(
                    label: Text('by_rank_asc'.tr),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    backgroundColor: Theme.of(context).splashColor.withOpacity(0.1),
                    selected: songsController.sortBy.value == 'by_rank_asc'.tr,
                    avatar: songsController.sortBy.value == 'by_rank_asc'.tr ? Icon(Icons.check, color: Theme.of(context).splashColor,) : null,
                    onSelected: (bool value) {
                      songsController.sortBy('by_rank_asc'.tr);
                      songsController.sortSongs();
                      Navigator.of(context).pop();
                    },
                  ),
                  ChoiceChip(
                    label: Text('by_rank_desc'.tr),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    backgroundColor: Theme.of(context).splashColor.withOpacity(0.1),
                    selected: songsController.sortBy.value == 'by_rank_desc'.tr,
                    avatar: songsController.sortBy.value == 'by_rank_desc'.tr ? const Icon(Icons.check,) : null,
                    onSelected: (bool value) {
                      songsController.sortBy('by_rank_desc'.tr);
                      songsController.sortSongs();
                      Navigator.of(context).pop();
                    },
                  ),
                  ChoiceChip(
                    label: Text('by_title_asc'.tr),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    backgroundColor: Theme.of(context).splashColor.withOpacity(0.1),
                    selected: songsController.sortBy.value == 'by_title_asc'.tr,
                    avatar: songsController.sortBy.value == 'by_title_asc'.tr ? Icon(Icons.check, color: Theme.of(context).splashColor,) : null,
                    onSelected: (bool value) {
                      songsController.sortBy('by_title_asc'.tr);
                      songsController.sortSongs();
                      Navigator.of(context).pop();
                    },
                  ),
                  ChoiceChip(
                    label: Text('by_title_desc'.tr),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    backgroundColor: Theme.of(context).splashColor.withOpacity(0.1),
                    selected: songsController.sortBy.value == 'by_title_desc'.tr,
                    avatar: songsController.sortBy.value == 'by_title_desc'.tr ? const Icon(Icons.check,) : null,
                    onSelected: (bool value) {
                      songsController.sortBy('by_title_desc'.tr);
                      songsController.sortSongs();
                      Navigator.of(context).pop();
                    },
                  ),
                  songsController.sortBy.value.isNotEmpty ? ChoiceChip(
                    label: Text('clear_filter'.tr),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    backgroundColor: Theme.of(context).splashColor.withOpacity(0.1),
                    selected: songsController.sortBy.value == 'clear_filter'.tr,
                    avatar: songsController.sortBy.value == 'clear_filter'.tr ? const Icon(Icons.check,) : null,
                    onSelected: (bool value) {
                      songsController.sortBy('by_rank_asc'.tr);
                      songsController.sortSongs();
                      Navigator.of(context).pop();
                    },
                  ) : const SizedBox(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
