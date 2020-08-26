import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_weather_mobile/view/pages/home/sections/information_date.dart';
import 'package:open_weather_mobile/view/styles/color.dart';
import 'package:open_weather_mobile/view/styles/constants.dart';
import 'package:open_weather_mobile/view/widgets/custom_inkwell.dart';
import 'package:open_weather_mobile/view/widgets/dialogs/dialogs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  _showInfoLocation() {
    Dialogs.showDialogInformation(
      context: context,
      title: 'Tebet, Jakarta Selatan',
      description:
          'Jl. Tebet Dalam Timur no.46 Kecamatan Tebet, Jakarta Selatan',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.dark,
            backgroundColor: Colors.transparent,
            elevation: 0,
            pinned: true,
            leading: CustomInkwell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(iconMenu),
              ),
            ),
          ),
          ..._buildSectionsInformationDate(),
        ],
      ),
    );
  }
}

List<Widget> _buildSectionsInformationDate() {
  return [
    SliverToBoxAdapter(child: InformationDate()),
  ];
}
