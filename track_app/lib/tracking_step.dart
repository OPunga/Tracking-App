import 'package:flutter/material.dart';

class TrackingStep extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final bool isActive;
  final bool hasDropdown;
  final bool isExpanded;
  final VoidCallback? onToggleExpand;
  final int index;

  const TrackingStep(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.date,
      this.isActive = false,
      this.hasDropdown = false,
      this.isExpanded = false,
      this.onToggleExpand,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: index == 1
                    ? Color(0xffecd85c)
                    : index == 2
                        ? Color(0xffd58242)
                        : Color(0xff242424),
                border: Border.all(color: Colors.grey),
                shape: BoxShape.circle,
              ),
              child: Icon(
                index == 1
                    ? Icons.inventory_rounded
                    : index == 2
                        ? Icons.directions_car_filled
                        : Icons.check_circle_outline,
                size: 28,
                color: index == 3 ? Colors.white : Colors.black,
              ),
            ),
            StatusLine(index: index),
            if (index == 2)
              if (hasDropdown && isExpanded)
                Column(
                  children: [
                    StatusPoint(),
                    StatusLine(index: index),
                    StatusPoint(),
                    StatusLine(index: index),
                    StatusPoint(),
                    StatusLine(index: index),
                    StatusPoint(),
                    StatusLine(index: index),
                  ],
                )
          ],
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        if (hasDropdown)
                          GestureDetector(
                            onTap: onToggleExpand,
                            child: Icon(
                              isExpanded ? Icons.expand_less : Icons.expand_more,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        Spacer(),
                        if (index != 3)
                          Text(
                            date,
                            style: TextStyle(color: Colors.white),
                          )
                      ],
                    ),
                  )
                ],
              ),
              Text(
                subtitle,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 25),
              if (hasDropdown && isExpanded)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Delivered',
                          style: TextStyle(color: Colors.white),
                        ),
                        Spacer(),
                        Text(
                          "15th Jan 2025",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Arrived at the sorting center',
                          style: TextStyle(color: Colors.white),
                        ),
                        Spacer(),
                        Text(
                          "15th Jan 2025",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Sent to Nairobi',
                          style: TextStyle(color: Colors.white),
                        ),
                        Spacer(),
                        Text(
                          "17th Jan 2025",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Text(
                      "Nairobi",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
            ],
          ),
        )
      ],
    );
  }
}

class StatusPoint extends StatelessWidget {
  const StatusPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: Color(0xffd58242),
            border: Border.all(color: Colors.grey),
            shape: BoxShape.circle,
          ),
        )
      ],
    );
  }
}

class StatusLine extends StatelessWidget {
  const StatusLine({super.key, required this.index});

  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: 25,
      color: index == 1
          ? Color(0xffecd85c)
          : index == 2
              ? Color(0xffd58242)
              : Colors.transparent,
    );
  }
}
