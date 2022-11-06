import 'package:flutter/material.dart';
import 'package:terf/widgets/comment_text.dart';

import '../../model/nearby_turf_model.dart';

class AminitiesWidget extends StatelessWidget {
  const AminitiesWidget({
    Key? key,
    required this.turfDetails,
  }) : super(key: key);

  final NearestTurfDetails turfDetails;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        turfDetails.turfAmenities!.turfWashroom == true
            ? TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.wash_outlined),
                label: const Text('Washroom'))
            : TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.wash_outlined,
                  color: Colors.grey,
                ),
                label: CommnText(
                  title: 'Washroom',
                  color: Colors.grey,
                )),
        turfDetails.turfAmenities!.turfDressing == true
            ? TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.room_outlined),
                label: const Text('Dressing Room'))
            : TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.room_preferences,
                  color: Colors.grey,
                ),
                label: CommnText(
                  title: 'Dressing Room ',
                  color: Colors.grey,
                )),
        turfDetails.turfAmenities!.turfWater == true
            ? TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.local_drink_outlined),
                label: const Text('Water'))
            : TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  (Icons.local_drink_outlined),
                  color: Colors.grey,
                ),
                label: CommnText(
                  title: 'Water',
                  color: Colors.grey,
                )),
        turfDetails.turfAmenities!.turfCafeteria == true
            ? TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.coffee),
                label: const Text('Cafeteria'))
            : TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  (Icons.coffee),
                  color: Colors.grey,
                ),
                label: CommnText(
                  title: 'Cafeteria',
                  color: Colors.grey,
                )),
        turfDetails.turfAmenities!.turfGallery == true
            ? TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.stadium_rounded),
                label: const Text('Gallery'))
            : TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  (Icons.stadium_rounded),
                  color: Colors.grey,
                ),
                label: CommnText(
                  title: 'Gallery',
                  color: Colors.grey,
                )),
        turfDetails.turfAmenities!.turfParking == true
            ? TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.local_parking_rounded),
                label: const Text('Parking'))
            : TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  (Icons.local_parking_rounded),
                  color: Colors.grey,
                ),
                label: CommnText(
                  title: 'Parking',
                  color: Colors.grey,
                ))
      ],
    );
  }
}
