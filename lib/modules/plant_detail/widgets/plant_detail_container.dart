import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../data/models/plant/plant.dart';
import 'plant_stats_container.dart';

class PlantDetailContainer extends StatefulWidget {
  const PlantDetailContainer({
    Key? key,
    required this.plant,
  }) : super(key: key);

  final Plant plant;

  @override
  State<PlantDetailContainer> createState() => _PlantDetailContainerState();
}

class _PlantDetailContainerState extends State<PlantDetailContainer> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 2 / 3,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(-1, -2),
              blurRadius: 3,
              spreadRadius: 3)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.plant.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.plant.scName,
            style: TextStyle(fontSize: 15, color: greenDark.withOpacity(0.5)),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            thickness: 1,
          ),
          PlantStats(plant: widget.plant),
          Divider(
            thickness: 1,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Plant Detail",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  isOpen
                      ? Text(widget.plant.description)
                      : Text(
                          widget.plant.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                  Divider(
                    thickness: 1,
                  ),
                  isOpen
                      ? Center(
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isOpen = false;
                                });
                              },
                              icon: Icon(Icons.expand_less_outlined)),
                        )
                      : Center(
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isOpen = true;
                                });
                              },
                              icon: Icon(Icons.expand_more_outlined)),
                        ),
                  SizedBox(
                    height: 120,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
