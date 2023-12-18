import 'package:duckduck/widgets/alarm/alarm_add_button.dart';
import 'package:duckduck/widgets/alarm/alarm_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/alarm_provider.dart';
import '../utils/colors.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  void initState() {
    super.initState();
    final alarmProvider = Provider.of<AlarmProvider>(context, listen: false);
    alarmProvider.fetchAlarms();
  }

  @override
  void didUpdateWidget(covariant AlarmPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    final alarmProvider = Provider.of<AlarmProvider>(context, listen: false);
    alarmProvider.fetchAlarms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Your alarm',
                  style: GoogleFonts.rubik(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: DuckDuckColors.steelBlack),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Consumer<AlarmProvider>(
                  builder: (context, provider, child) {
                    if (provider.alarms.isEmpty) {
                      return const Center(child: Text('No alarms set'));
                    }
                    return ListView.builder(
                      itemCount: provider.alarms.length,
                      itemBuilder: (context, index) {
                        return AlarmCard(alarm: provider.alarms[index]);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              AlarmAddButton(),
            ],
          ),
        ),
      ),
    );
  }
}
